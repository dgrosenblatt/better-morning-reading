include Magick

class BookUploader
  attr_accessor :author, :separator, :title

  def initialize(
    author:,
    title:,
    separator:,
    temp_subdirectory: 'upload',
    seed_file_path: Rails.root.join('db', 'seeds.rb')
  )
    @author = author
    @title = title
    @separator = separator
    @base_path = Rails.root.join('tmp', temp_subdirectory)
    FileUtils.mkdir_p("#{@base_path}/chapters")
    @book = File.new(Rails.root.join('tmp', 'book.html'))
    @seed_file = File.new(seed_file_path, "a")
  end

  def perform
    divide_into_chapters
    select_book_from_amazon
    process_cover_images
    upload_assets_to_s3
    append_seed_code
    remove_temp_files
  end

  private

  def divide_into_chapters
    chapter_number = 1
    chapter_file = File.new("#{@base_path}/chapters/chapter#{chapter_number}.html", "w+")
    line = @book.readline
    chapter_file.write line

    loop do
      begin
        line = @book.readline
      rescue EOFError
        puts "Extracted #{chapter_number} chapters. Proceed? (y/n)"
        system("open #{@base_path}")

        response = STDIN.gets.chomp
        if response.downcase == 'y'
          @total_chapter_count = chapter_number
          return
        else
          remove_temp_files
          puts 'Exiting to retry chapters'
          exit
        end
      end

      if line.start_with?(@separator)
        chapter_file.close
        chapter_number += 1
        chapter_file = File.new("#{@base_path}/chapters/chapter#{chapter_number}.html", "w+")
        chapter_file.write line
      else
        chapter_file.write line
      end
    end
  end

  def select_book_from_amazon
    puts "Searching amazon for #{@title} by #{@author}"
    results = Rainforest.search_books("#{@title} #{@author}")
    display_book_images(results)

    loop do
      break if @selected_book

      print 'Select a book (0-9): '
      selection = STDIN.gets.chomp.to_i

      puts 'Selected:'
      puts results[selection]

      puts 'Opening link...'
      system("open #{results[selection]['link']}")

      print 'Proceed? (y/n): '
      proceed = STDIN.gets.chomp
      if proceed.downcase == 'y'
        @selected_book = results[selection]
      end
    end
  end

  def process_cover_images
    puts 'Processing cover images'
    begin
      product = Rainforest.product(@selected_book['asin'])
      @image_full_url = product['main_image']['link']
    rescue
      puts 'Rainforest api call failed, please enter cover image url: '
      @image_full_url = STDIN.gets.chomp
    end

    image_path = "#{@base_path}/#{@title.parameterize}"

    puts 'Saving full size image'
    @full_image_path = "#{image_path}-full.jpg"
    IO.copy_stream(open(@image_full_url), @full_image_path)

    puts 'Saving thumbnail'
    @thumb_image_path = "#{image_path}-thumb.jpg"
    full_image = ImageList.new(@full_image_path)
    thumb = full_image.resize_to_fit(100, full_image.rows)
    thumb.write(@thumb_image_path)
  end

  def upload_assets_to_s3
    bucket = AWS_S3_BUCKET_NAME

    @thumb_s3_key = "#{@title.parameterize}/#{@title.parameterize}-thumb.jpg"
    puts "Uploading thumbnail to s3 (#{@thumb_s3_key})"
    s3.put_object({
      body: File.new(@thumb_image_path),
      bucket: bucket,
      key: @thumb_s3_key
    })

    @full_s3_key = "#{@title.parameterize}/#{@title.parameterize}-full.jpg"
    puts "Uploading thumbnail to s3 (#{@full_s3_key})"
    s3.put_object({
      body: File.new(@full_image_path),
      bucket: bucket,
      key: @full_s3_key,
    })

    @chapter_s3_base_key = "#{@title.parameterize}/chapters/chapter"
    puts "Uploading #{@total_chapter_count} chapters to s3 (#{@chapter_s3_base_key}*)"
    @total_chapter_count.times do |n|
      s3.put_object({
        body: File.new("#{@base_path}/chapters/chapter#{n+1}.html"),
        bucket: bucket,
        key: "#{@chapter_s3_base_key}#{n+1}.html"
      })
    end
  end

  def append_seed_code
    puts 'Adding to seeds.rb'
    book_var = "#{@title} book".parameterize(separator: '_')
    seed_ruby = <<~HEREDOC

      #{book_var} = Book.find_or_create_by(name: '#{@title}') do |book|
        book.author = '#{@author}'
        book.cover_image_full_s3_key = '#{@full_s3_key}'
        book.cover_image_thumb_s3_key = '#{@thumb_s3_key}'
        book.amazon_link = '#{@selected_book['link']}'
      end
      #{@total_chapter_count}.times do |n|
        Chapter.find_or_create_by(position: n+1, book_id: #{book_var}.id) do |chapter|
          chapter.name = "Chapter \#{n+1}"
          chapter.text_s3_key = "#{@chapter_s3_base_key}\#{n+1}.html"
        end
      end
      if #{book_var}.persisted?
        puts 'Seeded #{@title}'
      end
    HEREDOC

    @seed_file.write(seed_ruby)
    @seed_file.close
  end

  def create_chapter_file(chapter_number)
    File.new("#{@base_path}/chapters/chapter#{chapter_number}.html", "w+")
  end

  def display_book_images(rainforest_book_data)
    puts "Showing first ten results:"
    rainforest_book_data[0..9].each_with_index do |book, index|
      puts "Option #{index}:"
      puts book['title']
      system("imgcat #{book['image']} --width 240px")
      puts "*     *     *     *     *\n\n"
    end
  end

  def remove_temp_files
    FileUtils.rmtree(@base_path)
  end

  def s3
    @s3 ||= Aws::S3::Client.new(
      credentials: Aws::Credentials.new(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY),
      region: AWS_S3_BUCKET_REGION
    )
  end
end
