
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

magnificent_ambersons = Book.find_or_create_by(name: 'The Magnificent Ambersons') do |book|
  book.author = 'Booth Tarkington'
  book.cover_image_full_s3_key = 'magnificent-ambersons/magnificent-ambersons-full.jpg'
  book.cover_image_thumb_s3_key = 'magnificent-ambersons/magnificent-ambersons-thumb.jpg'
end
35.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: magnificent_ambersons.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "magnificent-ambersons/chapters/chapter#{n+1}.html"
  end
end
if magnificent_ambersons.persisted?
  puts 'Seeded The Magnificent Ambersons'
end

peter_and_wendy = Book.find_or_create_by(name: 'Peter and Wendy') do |book|
  book.author = 'J. M. Barrie'
  book.cover_image_full_s3_key = 'peter-and-wendy/peter-and-wendy-full.jpg'
  book.cover_image_thumb_s3_key = 'peter-and-wendy/peter-and-wendy-thumb.jpg'
end
17.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: peter_and_wendy.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "peter-and-wendy/chapters/chapter#{n+1}.html"
  end
end
if peter_and_wendy.persisted?
  puts 'Seeded Peter and Wendy'
end

wuthering_heights = Book.find_or_create_by(name: 'Wuthering Heights') do |book|
  book.author = 'Emily Bronte'
  book.cover_image_full_s3_key = 'wuthering-heights/wuthering-heights-full.jpg'
  book.cover_image_thumb_s3_key = 'wuthering-heights/wuthering-heights-thumb.jpg'
end
34.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: wuthering_heights.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "wuthering-heights/chapters/chapter#{n+1}.html"
  end
end
if wuthering_heights.persisted?
  puts 'Seeded Wuthering Heights'
end

charlotte_temple = Book.find_or_create_by(name: 'Charlotte Temple') do |book|
  book.author = 'Susanna Rowson'
  book.cover_image_full_s3_key = 'charlotte-temple/charlotte-temple-full.jpg'
  book.cover_image_thumb_s3_key = 'charlotte-temple/charlotte-temple-thumb.jpg'
end
35.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: charlotte_temple.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "charlotte-temple/chapters/chapter#{n+1}.html"
  end
end
if charlotte_temple.persisted?
  puts 'Seeded Charlotte Temple'
end

heart_of_darkness = Book.find_or_create_by(name: 'Heart of Darkness') do |book|
  book.author = 'Joseph Conrad'
  book.cover_image_full_s3_key = 'heart-of-darkness/heart-of-darkness-full.jpg'
  book.cover_image_thumb_s3_key = 'heart-of-darkness/heart-of-darkness-thumb.jpg'
end
3.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: heart_of_darkness.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "heart-of-darkness/chapters/chapter#{n+1}.html"
  end
end
if heart_of_darkness.persisted?
  puts 'Seeded Heart of Darkness'
end

jane_eyre = Book.find_or_create_by(name: 'Jane Eyre') do |book|
  book.author = 'Charlotte Bronte'
  book.cover_image_full_s3_key = 'jane-eyre/jane-eyre-full.jpg'
  book.cover_image_thumb_s3_key = 'jane-eyre/jane-eyre-thumb.jpg'
end
38.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: jane_eyre.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "jane-eyre/chapters/chapter#{n+1}.html"
  end
end
if jane_eyre.persisted?
  puts 'Seeded Jane Eyre'
end

lady_roses_daughter = Book.find_or_create_by(name: "Lady Rose's Daughter") do |book|
  book.author = 'Mrs. Humphry Ward'
  book.cover_image_full_s3_key = 'lady-roses-daughter/lady-roses-daughter-full.jpg'
  book.cover_image_thumb_s3_key = 'lady-roses-daughter/lady-roses-daughter-thumb.jpg'
end
24.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: lady_roses_daughter.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "lady-roses-daughter/chapters/chapter#{n+1}.html"
  end
end
if lady_roses_daughter.persisted?
  puts "Seeded Lady Rose's Daughter"
end

mysterious_affair = Book.find_or_create_by(name: "The Mysterious Affair at Styles") do |book|
  book.author = 'Agatha Christie'
  book.cover_image_full_s3_key = 'mysterious-affair-at-styles/mysterious-affair-at-styles-full.jpg'
  book.cover_image_thumb_s3_key = 'mysterious-affair-at-styles/mysterious-affair-at-styles-thumb.jpg'
end
13.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: mysterious_affair.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "mysterious-affair-at-styles/chapters/chapter#{n+1}.html"
  end
end
if mysterious_affair.persisted?
  puts "Seeded The Mysterious Affair at Styles"
end

metamorph = Book.find_or_create_by(name: "Metamorphosis") do |book|
  book.author = 'Franz Kafka'
  book.cover_image_full_s3_key = 'metamorphosis/metamorphosis-full.jpg'
  book.cover_image_thumb_s3_key = 'metamorphosis/metamorphosis-thumb.jpg'
end
3.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: metamorph.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "metamorphosis/chapters/chapter#{n+1}.html"
  end
end
if metamorph.persisted?
  puts "Seeded Metamorphosis"
end

ulysses = Book.find_or_create_by(name: "Ulysses") do |book|
  book.author = 'James Joyce'
  book.cover_image_full_s3_key = 'ulysses/ulysses-full.jpg'
  book.cover_image_thumb_s3_key = 'ulysses/ulysses-thumb.jpg'
end
18.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: ulysses.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "ulysses/chapters/chapter#{n+1}.html"
  end
end
if ulysses.persisted?
  puts "Seeded Ulysses"
end

cane = Book.find_or_create_by(name: "Cane") do |book|
  book.author = 'Jean Toomer'
  book.cover_image_full_s3_key = 'cane/cane-full.jpg'
  book.cover_image_thumb_s3_key = 'cane/cane-thumb.jpg'
end
11.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: cane.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "cane/chapters/chapter#{n+1}.html"
  end
end
if cane.persisted?
  puts "Seeded Cane"
end

riders_of_the_purple_sage = Book.find_or_create_by(name: "Riders of the Purple Sage") do |book|
  book.author = 'Zane Grey'
  book.cover_image_full_s3_key = 'riders-of-the-purple-sage/rides-of-the-purple-sage-full.jpg'
  book.cover_image_thumb_s3_key = 'riders-of-the-purple-sage/rides-of-the-purple-sage-thumb.jpg'
end
23.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: riders_of_the_purple_sage.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "riders-of-the-purple-sage/chapters/chapter#{n+1}.html"
  end
end
if riders_of_the_purple_sage.persisted?
  puts "Seeded Riders of the Purple Sage"
end

the_jungle = Book.find_or_create_by(name: "The Jungle") do |book|
  book.author = 'Upton Sinclair'
  book.cover_image_full_s3_key = 'the-jungle/the-jungle-full.jpg'
  book.cover_image_thumb_s3_key = 'the-jungle/the-jungle-thumb.jpg'
end
31.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_jungle.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-jungle/chapters/chapter#{n+1}.html"
  end
end
if the_jungle.persisted?
  puts "Seeded The Jungle"
end

winesburg_ohio = Book.find_or_create_by(name: "Winesburg, Ohio") do |book|
  book.author = 'Sherwood Anderson'
  book.cover_image_full_s3_key = 'winesburg-ohio/winesburg-ohio-full.jpg.jpg'
  book.cover_image_thumb_s3_key = 'winesburg-ohio/winesburg-ohio-thumb.jpg'
end
21.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: winesburg_ohio.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "winesburg-ohio/chapters/chapter#{n+1}.html"
  end
end
if winesburg_ohio.persisted?
  puts "Seeded Winesburg, Ohio"
end

tom_sawyer = Book.find_or_create_by(name: "The Adventures of Tom Sawyer") do |book|
  book.author = 'Mark Twain'
  book.cover_image_full_s3_key = 'tom-sawyer/tom-sawyer-full.jpg'
  book.cover_image_thumb_s3_key = 'tom-sawyer/tom-sawyer-thumb.jpg'
end
35.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: tom_sawyer.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "tom-sawyer/chapters/chapter#{n+1}.html"
  end
end
if tom_sawyer.persisted?
  puts "Seeded The Adventures of Tom Sawyer"
end

dracula_bram_stoker = Book.find_or_create_by(name: "Dracula") do |book|
  book.author = 'Bram Stoker'
  book.cover_image_full_s3_key = 'dracula/dracula-full.jpg'
  book.cover_image_thumb_s3_key = 'dracula/dracula-thumb.jpg'
end
27.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: dracula_bram_stoker.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "dracula/chapters/chapter#{n+1}.html"
  end
end
if dracula_bram_stoker.persisted?
  puts "Seeded Dracula"
end

huck_finn = Book.find_or_create_by(name: "Adventures of Huckleberry Finn") do |book|
  book.author = 'Mark Twain'
  book.cover_image_full_s3_key = 'huckleberry-finn/adventures-of-huckleberry-finn-full.jpg'
  book.cover_image_thumb_s3_key = 'huckleberry-finn/adventures-of-huckleberry-finn-thumb.jpg'
end
43.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: huck_finn.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "huckleberry-finn/chapters/chapter#{n+1}.html"
  end
end
if huck_finn.persisted?
  puts "Seeded Adventures of Huckleberry Finn"
end

little_women = Book.find_or_create_by(name: "Little Women") do |book|
  book.author = 'Louisa May Alcott'
  book.cover_image_full_s3_key = 'little-women/little-women-full.jpg'
  book.cover_image_thumb_s3_key = 'little-women/little-women-thumb.jpg'
end
47.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: little_women.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "little-women/chapters/chapter#{n+1}.html"
  end
end
if little_women.persisted?
  puts "Seeded Little Women"
end

emma_jane_austen = Book.find_or_create_by(name: "Emma") do |book|
  book.author = 'Jane Austen'
  book.cover_image_full_s3_key = 'emma/emma-full.jpg'
  book.cover_image_thumb_s3_key = 'emma/emma-thumb.jpg'
end
55.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: emma_jane_austen.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "emma/chapters/chapter#{n+1}.html"
  end
end
if emma_jane_austen.persisted?
  puts "Seeded Emma"
end

sense_and_sensibility = Book.find_or_create_by(name: "Sense and Sensibility") do |book|
  book.author = 'Jane Austen'
  book.cover_image_full_s3_key = 'sense-and-sensibility/sense-and-sensibility-full.jpg'
  book.cover_image_thumb_s3_key = 'sense-and-sensibility/sense-and-sensibility-thumb.jpg'
end
50.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: sense_and_sensibility.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "sense-and-sensibility/chapters/chapter#{n+1}.html"
  end
end
if sense_and_sensibility.persisted?
  puts "Seeded Sense and Sensibility"
end

house_of_mirth = Book.find_or_create_by(name: "The House of Mirth") do |book|
  book.author = 'Edith Wharton'
  book.cover_image_full_s3_key = 'the-house-of-mirth/house-of-mirth-full.jpg'
  book.cover_image_thumb_s3_key = 'the-house-of-mirth/house-of-mirth-thumb.jpg'
end
29.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: house_of_mirth.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-house-of-mirth/chapters/chapter#{n+1}.html"
  end
end
if house_of_mirth.persisted?
  puts "Seeded The House of Mirth"
end

room_with_a_view = Book.find_or_create_by(name: "A Room with a View") do |book|
  book.author = 'E.M. Forster'
  book.cover_image_full_s3_key = 'a-room-with-a-view/a-room-with-a-view-full.jpg'
  book.cover_image_thumb_s3_key = 'a-room-with-a-view/a-room-with-a-view-thumb.jpg'
end
20.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: room_with_a_view.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "a-room-with-a-view/chapters/chapter#{n+1}.html"
  end
end
if room_with_a_view.persisted?
  puts "Seeded A Room with a View"
end

passage_to_india = Book.find_or_create_by(name: "A Passage To India") do |book|
  book.author = 'E.M. Forster'
  book.cover_image_full_s3_key = 'a-passage-to-india/a-passage-to-india-full.jpg'
  book.cover_image_thumb_s3_key = 'a-passage-to-india/a-passage-to-india-thumb.jpg'
end
37.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: passage_to_india.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "a-passage-to-india/chapters/chapter#{n+1}.html"
  end
end
if passage_to_india.persisted?
  puts "Seeded A Passage To India"
end

garden_party = Book.find_or_create_by(name: "The Garden Party and Other Stories") do |book|
  book.author = 'Katherine Mansfield'
  book.cover_image_full_s3_key = 'the-garden-party/garden-party-full.jpg'
  book.cover_image_thumb_s3_key = 'the-garden-party/garden-party-thumb.jpg'
end
15.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: garden_party.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-garden-party/chapters/chapter#{n+1}.html"
  end
end
if garden_party.persisted?
  puts "Seeded The Garden Party and Other Stories"
end

main_street = Book.find_or_create_by(name: "Main Street") do |book|
  book.author = 'Sinclair Lewis'
  book.cover_image_full_s3_key = 'main-street/main-street-full.jpg'
  book.cover_image_thumb_s3_key = 'main-street/main-street-thumb.jpg'
end
39.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: main_street.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "main-street/chapters/chapter#{n+1}.html"
  end
end
if main_street.persisted?
  puts "Seeded Main Street"
end

this_side_of_paradise = Book.find_or_create_by(name: "This Side of Paradise") do |book|
  book.author = 'F. Scott Fitzgerald'
  book.cover_image_full_s3_key = 'this-side-of-paradise/this-side-of-paradise-full.jpg'
  book.cover_image_thumb_s3_key = 'this-side-of-paradise/this-side-of-paradise-thumb.jpg'
  # book.amazon_link = 'https://www.amazon.com/gp/product/1500982318/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1500982318&linkCode=as2&tag=bettermorning-20&linkId=8175e513367eb292263e1ed46203e373'
end
10.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: this_side_of_paradise.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "this-side-of-paradise/chapters/chapter#{n+1}.html"
  end
end
if this_side_of_paradise.persisted?
  puts "Seeded This Side of Paradise"
end

the_age_of_innocence = Book.find_or_create_by(name: "The Age of Innocence") do |book|
  book.author = 'Edith Wharton'
  book.cover_image_full_s3_key = 'the-age-of-innocence/the-age-of-innocence-full.jpg'
  book.cover_image_thumb_s3_key = 'the-age-of-innocence/the-age-of-innocence-thumb.jpg'
  # book.amazon_link = 'https://www.amazon.com/gp/product/1514639211/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1514639211&linkCode=as2&tag=bettermorning-20&linkId=353a680c983a26cb147ff0587f84def9'
end
34.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_age_of_innocence.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-age-of-innocence/chapters/chapter#{n+1}.html"
  end
end
if the_age_of_innocence.persisted?
  puts "Seeded The Age of Innocence"
end

twelve_years_a_slave = Book.find_or_create_by(name: "12 Years a Slave") do |book|
  book.author = 'Solomon Northup'
  book.cover_image_full_s3_key = '12-years-a-slave/12-years-a-slave-full.jpg'
  book.cover_image_thumb_s3_key = '12-years-a-slave/12-years-a-slave-thumb.jpg'
  # book.amazon_link = 'https://www.amazon.com/gp/product/1631680021/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1631680021&linkCode=as2&tag=bettermorning-20&linkId=741e570b7a90cc6953ee940b80c6c1cb'
end
22.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: twelve_years_a_slave.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "12-years-a-slave/chapters/chapter#{n+1}.html"
  end
end
if twelve_years_a_slave.persisted?
  puts "Seeded 12 Years a Slave"
end

war_of_the_worlds = Book.find_or_create_by(name: "The War of the Worlds") do |book|
  book.author = 'H. G. Wells'
  book.cover_image_full_s3_key = 'the-war-of-the-worlds/the-war-of-the-worlds-full.jpg'
  book.cover_image_thumb_s3_key = 'the-war-of-the-worlds/the-war-of-the-worlds-thumb.jpg'
  # book.amazon_link = 'https://www.amazon.com/gp/product/B085RSFL4C/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B085RSFL4C&linkCode=as2&tag=bettermorning-20&linkId=fd3530a7ef9fa6f08533bc97af081e69'
end
27.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: war_of_the_worlds.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-war-of-the-worlds/chapters/chapter#{n+1}.html"
  end
end
if war_of_the_worlds.persisted?
  puts "Seeded The War of the Worlds"
end

anne_of_green_gables = Book.find_or_create_by(name: "Anne of Green Gables") do |book|
  book.author = 'Lucy Maud Montgomery'
  book.cover_image_full_s3_key = 'anne-of-green-gables/anne-of-green-gables-full.jpg'
  book.cover_image_thumb_s3_key = 'anne-of-green-gables/anne-of-green-gables-thumb.jpg'
  # book.amazon_link = 'https://www.amazon.com/gp/product/055321313X/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=055321313X&linkCode=as2&tag=bettermorning-20&linkId=83fb0d3dc533a3bcaf2aba9d007d5e83'
end
38.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: anne_of_green_gables.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "anne-of-green-gables/chapters/chapter#{n+1}.html"
  end
end
if anne_of_green_gables.persisted?
  puts "Seeded Anne of Green Gables"
end
