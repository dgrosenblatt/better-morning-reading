require 'rails_helper'
require 'fileutils'

RSpec.describe BookUploader do
  author = 'Leslie Knope'
  title = 'History of Pawnee'
  separator = '<h2>'
  temp_subdirectory = 'upload-test'
  seed_file_path = Rails.root.join('tmp', 'seeds.rb')

  before(:all) do
    book_path = Rails.root.join('tmp', 'book.html')
    fixture_path = Rails.root.join('spec', 'support', 'fixtures', 'book.html')
    FileUtils.copy(fixture_path, book_path, preserve: false)
  end

  before do
    FileUtils.remove(seed_file_path)
    File.new(seed_file_path, "a")
  end

  describe 'setup' do
    it 'creates a chapters temp directory' do
      BookUploader.new(
        author: author,
        title: title,
        separator: separator,
        temp_subdirectory: temp_subdirectory,
      )

      dir = Dir[Rails.root.join('tmp', temp_subdirectory)]

      expect(dir).not_to be_empty
    end
  end

  describe 'perform' do
    context 'chapter files' do
      let(:uploader) do
        uploader = BookUploader.new(
          author: author,
          title: title,
          separator: separator,
          temp_subdirectory: temp_subdirectory,
          seed_file_path: seed_file_path
        )
        allow(uploader).to receive(:system)
        allow(uploader).to receive(:puts)
        allow(uploader).to receive(:exit) { raise 'Exit but continue rspec'}

        uploader
      end

      it 'divides chapters into separate files and opens the containing directory for inspection' do
        allow(STDIN).to receive(:gets).and_return('y')

        # call private method in isolation to assert before temp file cleanup
        uploader.send(:divide_into_chapters)

        dir = Dir[Rails.root.join('tmp', temp_subdirectory, 'chapters/*')]

        expect(dir.length).to eq 5

        (1..5).each do |n|
          expect(dir).to include(
            Rails.root.join('tmp', temp_subdirectory, 'chapters', "chapter#{n}.html").to_s
          )
        end

        base_path = Rails.root.join('tmp', temp_subdirectory)
        expect(uploader).to have_received(:system).with("open #{base_path}")

        # clean up manually
        uploader.send(:remove_temp_files)
      end

      it 'bails and removes chapter files if user does not approve' do
        allow(STDIN).to receive(:gets).and_return('n')

        begin
          # call private method in isolation to assert before temp file cleanup
          uploader.send(:divide_into_chapters)
        rescue
          dir = Dir[Rails.root.join('tmp', temp_subdirectory, 'chapters/*')]

          expect(dir).to be_empty
          expect(uploader).to have_received(:puts).with('Exiting to retry chapters')
        end
      end
    end

    context 'post-book parsing steps' do
      let(:uploader) do
        uploader = BookUploader.new(
          author: author,
          title: title,
          separator: separator,
          temp_subdirectory: temp_subdirectory,
          seed_file_path: seed_file_path
        )

        allow(Rainforest).to receive(:search_books)
          .and_return(MockRainforest.search_books)
        allow(Rainforest).to receive(:product)
          .and_return(MockRainforest.product)
        allow_any_instance_of(Aws::S3::Client).to receive(:put_object)

        allow(uploader).to receive(:puts)
        allow(uploader).to receive(:print)
        allow(uploader).to receive(:system)
        allow(STDIN).to receive(:gets).and_return('y', '1', 'y')

        uploader
      end

      it 'fetches book data from rainforest api' do
        uploader.perform

        expect(Rainforest).to have_received(:search_books)
          .with("#{title} #{author}")
        expect(uploader).to have_received(:puts)
          .with(MockRainforest.search_books[1])
        expect(uploader).to have_received(:system)
          .with('open http://example.com/eagleton')
      end

      it 'saves and resizes cover images' do
        # call private method in isolation to assert before temp file cleanup
        uploader.send(:select_book_from_amazon)
        uploader.send(:process_cover_images)

        image_files = Dir[Rails.root.join('tmp', temp_subdirectory, 'history-of-pawnee*')]
        expect(image_files).to include(
          Rails.root.join('tmp', temp_subdirectory, 'history-of-pawnee-full.jpg').to_s
        )
        expect(image_files).to include(
          Rails.root.join('tmp', temp_subdirectory, 'history-of-pawnee-thumb.jpg').to_s
        )

        # clean up manually
        uploader.send(:remove_temp_files)
      end

      it 'uploads chapters and images to s3' do
        expect_any_instance_of(Aws::S3::Client).to receive(:put_object).with(
          hash_including(key: 'history-of-pawnee/history-of-pawnee-thumb.jpg', bucket: AWS_S3_BUCKET_NAME)
        )
        expect_any_instance_of(Aws::S3::Client).to receive(:put_object).with(
          hash_including(key: 'history-of-pawnee/history-of-pawnee-full.jpg', bucket: AWS_S3_BUCKET_NAME)
        )

        expect_any_instance_of(Aws::S3::Client).to receive(:put_object).with(
          hash_including(key: 'history-of-pawnee/chapters/chapter1.html', bucket: AWS_S3_BUCKET_NAME)
        )
        expect_any_instance_of(Aws::S3::Client).to receive(:put_object).with(
          hash_including(key: 'history-of-pawnee/chapters/chapter2.html', bucket: AWS_S3_BUCKET_NAME)
        )
        expect_any_instance_of(Aws::S3::Client).to receive(:put_object).with(
          hash_including(key: 'history-of-pawnee/chapters/chapter3.html', bucket: AWS_S3_BUCKET_NAME)
        )
        expect_any_instance_of(Aws::S3::Client).to receive(:put_object).with(
          hash_including(key: 'history-of-pawnee/chapters/chapter4.html', bucket: AWS_S3_BUCKET_NAME)
        )
        expect_any_instance_of(Aws::S3::Client).to receive(:put_object).with(
          hash_including(key: 'history-of-pawnee/chapters/chapter5.html', bucket: AWS_S3_BUCKET_NAME)
        )

        uploader.perform
      end

      it 'appends ruby to seed file' do
        uploader.perform

        seeds = File.read(seed_file_path)

        expect(seeds).to eq ("\nhistory_of_pawnee_book = Book.find_or_create_by(name: 'History of Pawnee') do |book|\n  book.author = 'Leslie Knope'\n  book.cover_image_full_s3_key = 'history-of-pawnee/history-of-pawnee-full.jpg'\n  book.cover_image_thumb_s3_key = 'history-of-pawnee/history-of-pawnee-thumb.jpg'\n  book.amazon_link = 'http://example.com/eagleton'\nend\n5.times do |n|\n  Chapter.find_or_create_by(position: n+1, book_id: history_of_pawnee_book.id) do |chapter|\n    chapter.name = \"Chapter \#{n+1}\"\n    chapter.text_s3_key = \"history-of-pawnee/chapters/chapter\#{n+1}.html\"\n  end\nend\nif history_of_pawnee_book.persisted?\n  puts 'Seeded History of Pawnee'\nend\n")
      end

      it 'removes all the temp files' do
        uploader.perform

        dir = Dir[Rails.root.join('tmp', temp_subdirectory)]

        expect(dir).to be_empty
      end
    end
  end
end
