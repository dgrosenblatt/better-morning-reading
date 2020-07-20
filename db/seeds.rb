
pride = Book.find_or_create_by(name: 'Pride and Prejudice') do |book|
  book.author = 'Jane Austen'
  book.cover_image_thumb_s3_key = 'pride-and-prejudice/pride-and-prejudice-thumb.jpg'
  book.cover_image_full_s3_key = 'pride-and-prejudice/pride-and-prejudice-full.jpg'
end
61.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: pride.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "pride-and-prejudice/chapters/chapter#{n+1}.html"
  end
end
if pride.persisted?
  puts 'Seeded Pride and Prejudice'
end

alice = Book.find_or_create_by(name: 'Alice In Wonderland') do |book|
  book.author = 'Lewis Carroll'
  book.cover_image_full_s3_key = 'alice-in-wonderland/alice-in-wonderland-full.jpg'
  book.cover_image_thumb_s3_key = 'alice-in-wonderland/alice-in-wonderland-thumb.jpg'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: alice.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "alice-in-wonderland/chapters/chapter#{n+1}.html"
  end
end
if alice.persisted?
  puts 'Seeded Alice In Wonderland'
end

sherlock = Book.find_or_create_by(name: 'The Adventures of Sherlock Holmes') do |book|
  book.author = 'Arthur Conan Doyle'
  book.cover_image_full_s3_key = 'sherlock-holmes/sherlock-holmes-full.jpg'
  book.cover_image_thumb_s3_key = 'sherlock-holmes/sherlock-holmes-thumb.jpg'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: sherlock.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "sherlock-holmes/chapters/chapter#{n+1}.html"
  end
end
if sherlock.persisted?
  puts 'Seeded Sherlock Holmes'
end

uncle_toms_cabin = Book.find_or_create_by(name: "Uncle Tom's Cabin") do |book|
  book.author = 'Harriet Beecher Stowe'
  book.cover_image_full_s3_key = 'uncle-toms-cabin/uncle-toms-cabin-full.jpg'
  book.cover_image_thumb_s3_key = 'uncle-toms-cabin/uncle-toms-cabin-thumb.jpg'
end
45.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: uncle_toms_cabin.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "uncle-toms-cabin/chapters/chapter#{n+1}.html"
  end
end
if uncle_toms_cabin.persisted?
  puts "Seeded Uncle Tom's Cabin"
end

call_of_the_wild = Book.find_or_create_by(name: 'The Call of the Wild') do |book|
  book.author = 'Jack London'
  book.cover_image_full_s3_key = 'the-call-of-the-wild/call-of-the-wild-full.jpg'
  book.cover_image_thumb_s3_key = 'the-call-of-the-wild/call-of-the-wild-thumb.jpg'
end
7.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: call_of_the_wild.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-call-of-the-wild/chapters/chapter#{n+1}.html"
  end
end
if call_of_the_wild.persisted?
  puts 'Seeded The Call of the Wild'
end

tale_of_two_cities = Book.find_or_create_by(name: 'A Tale of Two Cities') do |book|
  book.author = 'Charles Dickens'
  book.cover_image_full_s3_key = 'a-tale-of-two-cities/tale-of-two-cities-full.jpg'
  book.cover_image_thumb_s3_key = 'a-tale-of-two-cities/tale-of-two-cities-thumb.jpg'
end
45.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: tale_of_two_cities.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "a-tale-of-two-cities/chapters/chapter#{n+1}.html"
  end
end
if tale_of_two_cities.persisted?
  puts 'Seeded A Tale of Two Cities'
end

frankenstein = Book.find_or_create_by(name: 'Frankenstein') do |book|
  book.author = 'Mary Wollstonecraft Shelley'
  book.cover_image_full_s3_key = 'frankenstein/frankenstein-full.jpg'
  book.cover_image_thumb_s3_key = 'frankenstein/frankenstein-thumb.jpg'
end
28.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: frankenstein.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "frankenstein/chapters/chapter#{n+1}.html"
  end
end
if frankenstein.persisted?
  puts 'Seeded Frankenstein'
end

moby_dick = Book.find_or_create_by(name: 'Moby Dick') do |book|
  book.author = 'Herman Melville'
  book.cover_image_full_s3_key = 'moby-dick/moby-dick-full.jpg'
  book.cover_image_thumb_s3_key = 'moby-dick/moby-dick-thumb.jpg'
end
136.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: moby_dick.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "moby-dick/chapters/chapter#{n+1}.html"
  end
end
if moby_dick.persisted?
  puts 'Seeded Moby Dick'
end

dorian_gray = Book.find_or_create_by(name: 'The Picture of Dorian Gray') do |book|
  book.author = 'Oscar Wilde'
  book.cover_image_full_s3_key = 'the-picture-of-dorian-gray/picture-of-dorian-gray-full.jpg'
  book.cover_image_thumb_s3_key = 'the-picture-of-dorian-gray/picture-of-dorian-gray-thumb.jpg'
end
20.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: dorian_gray.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-picture-of-dorian-gray/chapters/chapter#{n+1}.html"
  end
end
if dorian_gray.persisted?
  puts 'Seeded The Picture of Dorian Gray'
end

walden = Book.find_or_create_by(name: 'Walden') do |book|
  book.author = 'Henry David Thoreau'
  book.cover_image_full_s3_key = 'walden/walden-full.jpg'
  book.cover_image_thumb_s3_key = 'walden/walden-thumb.jpg'
end
18.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: walden.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "walden/chapters/chapter#{n+1}.html"
  end
end
if walden.persisted?
  puts 'Seeded Walden'
end
