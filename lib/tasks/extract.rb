puts "Starting process"


book = File.new("book.html")
separator = '<h2>'
ch_number = 0
chapter_file = File.new("chapter#{ch_number}.html", "w+")

loop do
  line = book.readline

  if line.start_with?(separator)
    chapter_file.close

    ch_number += 1
    puts "Starting new chapter: #{ch_number}"

    chapter_file = File.new("chapter#{ch_number}.html", "w+")
    chapter_file.write line
  else
    chapter_file.write line
  end

end

