require_relative 'book_uploader'

desc 'Prepare a book for seeds'
task uploader: [:environment] do
  separator = '<h2>'
  print 'Enter chapter separator: (<h2>)'
  separator_input = STDIN.gets.chomp
  if separator_input.present?
    separator = separator_input
  end

  print 'Enter author: '
  author = STDIN.gets.chomp

  print 'Enter title: '
  title = STDIN.gets.chomp

  BookUploader.new(separator: separator, author: author, title: title).perform
end
