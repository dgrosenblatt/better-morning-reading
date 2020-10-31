include Magick

class BookUploader
  attr_reader :author, :book, :separator, :title

  def initialize(author:, title:, separator:)
    @author = author
    @title = title
    @separator = separator
    @base_path = Rails.root.join('tmp', 'upload')
    FileUtils.mkdir_p("#{@base_path}/chapters")
    @book = File.new(Rails.root.join('tmp', 'book.html'))
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
    ch_number = 1
    chapter_file = File.new("#{@base_path}/chapters/chapter#{ch_number}.html", "w+")

    loop do
      begin
        line = book.readline
      rescue EOFError
        puts "Extracted #{ch_number} chapters. Proceed? (y/n)"
        response = STDIN.gets.chomp
        if response.downcase == 'y'
          @total_chapter_count = ch_number
          return
        else
          remove_temp_files
          puts 'Exiting to retry chapters'
          exit
        end
      end

      if line.start_with?(separator)
        chapter_file.close
        ch_number += 1
        chapter_file = File.new("#{@base_path}/chapters/chapter#{ch_number}.html", "w+")
        chapter_file.write line
      else
        chapter_file.write line
      end
    end
  end

  def select_book_from_amazon
    puts "Searching amazon for #{title} by #{author}"
    results = Rainforest.search_books("#{@title} #{@author}")

    puts "Showing first ten results:"
    results[0..9].each_with_index do |result, index|
      puts "Option #{index}:"
      puts result['title']
      system("imgcat #{result['image']} --width 240px")
      puts "*     *     *     *     *\n\n"
    end

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

    product = Rainforest.product(@selected_book['asin'])
    image_full_url = product['main_image']['link']

    image_path = "#{@base_path}/#{title.parameterize}"

    puts 'Saving full size image'
    @full_image_path = "#{image_path}-full.jpg"
    IO.copy_stream(open(image_full_url), @full_image_path)

    puts 'Saving thumbnail'
    @thumb_image_path = "#{image_path}-thumb.jpg"
    full_image = ImageList.new(@full_image_path)
    thumb = full_image.resize_to_fit(100, full_image.rows)
    thumb.write(@thumb_image_path)
  end

  def upload_assets_to_s3
    bucket = AWS_S3_BUCKET_NAME

    @thumb_s3_key = "#{title.parameterize}/#{title.parameterize}-thumb.jpg"
    puts "Uploading thumbnail to s3 (#{@thumb_s3_key})"
    s3.put_object({
      body: File.new(@thumb_image_path),
      bucket: bucket,
      key: @thumb_s3_key
    })

    @full_s3_key = "#{title.parameterize}/#{title.parameterize}-full.jpg"
    puts "Uploading thumbnail to s3 (#{@full_s3_key})"
    s3.put_object({
      body: File.new(@full_image_path),
      bucket: bucket,
      key: @full_s3_key,
    })

    @chapter_s3_base_key = "#{title.parameterize}/chapters/chapter"
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
    book_var = "#{title} book".parameterize(separator: '_')
    seed_ruby = <<~HEREDOC

      #{book_var} = Book.find_or_create_by(name: '#{title}') do |book|
        book.author = '#{author}'
        book.cover_image_full_s3_key = '#{@full_s3_key}'
        book.cover_image_thumb_s3_key = '#{@thumb_s3_key}'
        book.amazon_link = '#{@selected_book['link']}'
      end
      #{@total_chapter_count}.times do |n|
        Chapter.find_or_create_by(position: n+1, book_id: #{book_var}.id) do |chapter|
          chapter.name = 'Chapter \#{n+1}'
          chapter.text_s3_key = '#{@chapter_s3_base_key}\#{n+1}.html'
        end
      end
      if #{book_var}.persisted?
        puts 'Seeded #{title}'
      end
    HEREDOC

    seeds = File.new(Rails.root.join('db', 'seeds.rb'), "a")
    seeds.write(seed_ruby)
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
