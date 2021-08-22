
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
  book.amazon_link = 'https://www.amazon.com/gp/product/1500982318/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1500982318&linkCode=as2&tag=bettermorning-20&linkId=8175e513367eb292263e1ed46203e373'
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
  book.amazon_link = 'https://www.amazon.com/gp/product/1514639211/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1514639211&linkCode=as2&tag=bettermorning-20&linkId=353a680c983a26cb147ff0587f84def9'
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
  book.amazon_link = 'https://www.amazon.com/gp/product/1631680021/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1631680021&linkCode=as2&tag=bettermorning-20&linkId=741e570b7a90cc6953ee940b80c6c1cb'
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
  book.amazon_link = 'https://www.amazon.com/gp/product/B085RSFL4C/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B085RSFL4C&linkCode=as2&tag=bettermorning-20&linkId=fd3530a7ef9fa6f08533bc97af081e69'
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
  book.amazon_link = 'https://www.amazon.com/gp/product/055321313X/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=055321313X&linkCode=as2&tag=bettermorning-20&linkId=83fb0d3dc533a3bcaf2aba9d007d5e83'
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

flat_land = Book.find_or_create_by(name: "Flatland: A Romance of Many Dimensions") do |book|
  book.author = 'Edwin A. Abbott'
  book.cover_image_full_s3_key = 'flatland/flatland-full.jpg'
  book.cover_image_thumb_s3_key = 'flatland/flatland-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/gp/product/1733561625/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1733561625&linkId=507d6798bfd578126446fe5dbfe140ed'
end
22.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: flat_land.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "flatland/chapters/chapter#{n+1}.html"
  end
end
if flat_land.persisted?
  puts "Seeded Flatland"
end

the_invisible_man = Book.find_or_create_by(name: "The Invisible Man") do |book|
  book.author = 'H.G. Wells'
  book.cover_image_full_s3_key = 'the-invisible-man/the-invisible-man-full.jpg'
  book.cover_image_thumb_s3_key = 'the-invisible-man/the-invisible-man-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/gp/product/0451531671/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0451531671&linkId=b42411a48a9db22cb52468b2d67d6a38'
end
29.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_invisible_man.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-invisible-man/chapters/chapter#{n+1}.html"
  end
end
if the_invisible_man.persisted?
  puts "Seeded The Invisible Man"
end

the_souls_of_black_folk = Book.find_or_create_by(name: "The Souls of Black Folk") do |book|
  book.author = 'W.E.B. Du Bois'
  book.cover_image_full_s3_key = 'the-souls-of-black-folk/the-souls-of-black-folk-full.jpg'
  book.cover_image_thumb_s3_key = 'the-souls-of-black-folk/the-souls-of-black-folk-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/gp/product/1505223377/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1505223377&linkId=1231f56636cb67c96b4347b07b041897'
end
15.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_souls_of_black_folk.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-souls-of-black-folk/chapters/chapter#{n+1}.html"
  end
end
if the_souls_of_black_folk.persisted?
  puts "Seeded The Souls of Black Folk"
end

up_from_slavery = Book.find_or_create_by(name: "Up From Slavery") do |book|
  book.author = 'Booker T. Washington'
  book.cover_image_full_s3_key = 'up-from-slavery/up-from-slavery-full.jpg'
  book.cover_image_thumb_s3_key = 'up-from-slavery/up-from-slavery-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/gp/product/B08J21KPHC/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B08J21KPHC&linkId=f85581b15bbce007ec79568d80093486'
end
17.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: up_from_slavery.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "up-from-slavery/chapters/chapter#{n+1}.html"
  end
end
if up_from_slavery.persisted?
  puts "Seeded Up From Slavery"
end

last_of_the_mohicans = Book.find_or_create_by(name: "The Last of the Mohicans") do |book|
  book.author = 'James Fenimore Cooper'
  book.cover_image_full_s3_key = 'the-last-of-the-mohicans/the-last-of-the-mohicans-full.jpg'
  book.cover_image_thumb_s3_key = 'the-last-of-the-mohicans/the-last-of-the-mohicans-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/gp/product/0553213296/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0553213296&linkId=7447c6c2dad5efb53dcdc55c7c2890e1'
end
33.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: last_of_the_mohicans.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-last-of-the-mohicans/chapters/chapter#{n+1}.html"
  end
end
if last_of_the_mohicans.persisted?
  puts "Seeded The Last of the Mohicans"
end

lord_jim_book = Book.find_or_create_by(name: 'Lord Jim') do |book|
  book.author = 'Joseph Conrad'
  book.cover_image_full_s3_key = 'lord-jim/lord-jim-full.jpg'
  book.cover_image_thumb_s3_key = 'lord-jim/lord-jim-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B00JVWSATQ?tag=bettermorning-20'
end
45.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: lord_jim_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "lord-jim/chapters/chapter#{n+1}.html"
  end
end
if lord_jim_book.persisted?
  puts 'Seeded Lord Jim'
end

sister_carrie_book = Book.find_or_create_by(name: 'Sister Carrie') do |book|
  book.author = 'Theodore Dreiser'
  book.cover_image_full_s3_key = 'sister-carrie/sister-carrie-full.jpg'
  book.cover_image_thumb_s3_key = 'sister-carrie/sister-carrie-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1798514818?tag=bettermorning-20'
end
47.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: sister_carrie_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "sister-carrie/chapters/chapter#{n+1}.html"
  end
end
if sister_carrie_book.persisted?
  puts 'Seeded Sister Carrie'
end

kim_book = Book.find_or_create_by(name: 'Kim') do |book|
  book.author = 'Rudyard Kipling'
  book.cover_image_full_s3_key = 'kim/kim-full.jpg'
  book.cover_image_thumb_s3_key = 'kim/kim-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/0141332506?tag=bettermorning-20'
end
15.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: kim_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "kim/chapters/chapter#{n+1}.html"
  end
end
if kim_book.persisted?
  puts 'Seeded Kim'
end

the_scarlet_pimpernel_book = Book.find_or_create_by(name: 'The Scarlet Pimpernel') do |book|
  book.author = 'Baroness Orczy'
  book.cover_image_full_s3_key = 'the-scarlet-pimpernel/the-scarlet-pimpernel-full.jpg'
  book.cover_image_thumb_s3_key = 'the-scarlet-pimpernel/the-scarlet-pimpernel-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/0451527623?tag=bettermorning-20'
end
31.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_scarlet_pimpernel_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-scarlet-pimpernel/chapters/chapter#{n+1}.html"
  end
end
if the_scarlet_pimpernel_book.persisted?
  puts 'Seeded The Scarlet Pimpernel'
end

the_secret_garden_book = Book.find_or_create_by(name: 'The Secret Garden') do |book|
  book.author = 'Frances Hodgson Burnett'
  book.cover_image_full_s3_key = 'the-secret-garden/the-secret-garden-full.jpg'
  book.cover_image_thumb_s3_key = 'the-secret-garden/the-secret-garden-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1691514063?tag=bettermorning-20'
end
27.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_secret_garden_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-secret-garden/chapters/chapter#{n+1}.html"
  end
end
if the_secret_garden_book.persisted?
  puts 'Seeded The Secret Garden'
end

howards_end_book = Book.find_or_create_by(name: 'Howards End') do |book|
  book.author = 'E. M. Forster'
  book.cover_image_full_s3_key = 'howards-end/howards-end-full.jpg'
  book.cover_image_thumb_s3_key = 'howards-end/howards-end-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B00I6LM1E8?tag=bettermorning-20'
end
44.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: howards_end_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "howards-end/chapters/chapter#{n+1}.html"
  end
end
if howards_end_book.persisted?
  puts 'Seeded Howards End'
end

the_time_machine_book = Book.find_or_create_by(name: 'The Time Machine') do |book|
  book.author = 'H. G. Wells'
  book.cover_image_full_s3_key = 'the-time-machine/the-time-machine-full.jpg'
  book.cover_image_thumb_s3_key = 'the-time-machine/the-time-machine-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/0553213512?tag=bettermorning-20'
end
17.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_time_machine_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-time-machine/chapters/chapter#{n+1}.html"
  end
end
if the_time_machine_book.persisted?
  puts 'Seeded The Time Machine'
end

northanger_abbey_book = Book.find_or_create_by(name: 'Northanger Abbey') do |book|
  book.author = 'Jane Austen'
  book.cover_image_full_s3_key = 'northanger-abbey/northanger-abbey-full.jpg'
  book.cover_image_thumb_s3_key = 'northanger-abbey/northanger-abbey-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1853260436?tag=bettermorning-20'
end
31.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: northanger_abbey_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "northanger-abbey/chapters/chapter#{n+1}.html"
  end
end
if northanger_abbey_book.persisted?
  puts 'Seeded Northanger Abbey'
end

persuasion_book = Book.find_or_create_by(name: 'Persuasion') do |book|
  book.author = 'Jane Austen'
  book.cover_image_full_s3_key = 'persuasion/persuasion-full.jpg'
  book.cover_image_thumb_s3_key = 'persuasion/persuasion-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/150329031X?tag=bettermorning-20'
end
24.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: persuasion_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "persuasion/chapters/chapter#{n+1}.html"
  end
end
if persuasion_book.persisted?
  puts 'Seeded Persuasion'
end

the_life_and_adventures_of_robinson_crusoe_book = Book.find_or_create_by(name: 'The Life and Adventures of Robinson Crusoe') do |book|
  book.author = 'Daniel Defoe'
  book.cover_image_full_s3_key = 'the-life-and-adventures-of-robinson-crusoe/the-life-and-adventures-of-robinson-crusoe-full.jpg'
  book.cover_image_thumb_s3_key = 'the-life-and-adventures-of-robinson-crusoe/the-life-and-adventures-of-robinson-crusoe-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08CG15X4P?tag=bettermorning-20'
end
20.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_life_and_adventures_of_robinson_crusoe_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-life-and-adventures-of-robinson-crusoe/chapters/chapter#{n+1}.html"
  end
end
if the_life_and_adventures_of_robinson_crusoe_book.persisted?
  puts 'Seeded The Life and Adventures of Robinson Crusoe'
end

madame_bovary_book = Book.find_or_create_by(name: 'Madame Bovary') do |book|
  book.author = 'Gustave Flaubert'
  book.cover_image_full_s3_key = 'madame-bovary/madame-bovary-full.jpg'
  book.cover_image_thumb_s3_key = 'madame-bovary/madame-bovary-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1853260789?tag=bettermorning-20'
end
35.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: madame_bovary_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "madame-bovary/chapters/chapter#{n+1}.html"
  end
end
if madame_bovary_book.persisted?
  puts 'Seeded Madame Bovary'
end

the_wonderful_wizard_of_oz_book = Book.find_or_create_by(name: 'The Wonderful Wizard of Oz') do |book|
  book.author = 'L. Frank Baum'
  book.cover_image_full_s3_key = 'the-wonderful-wizard-of-oz/the-wonderful-wizard-of-oz-full.jpg'
  book.cover_image_thumb_s3_key = 'the-wonderful-wizard-of-oz/the-wonderful-wizard-of-oz-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1604335424?tag=bettermorning-20'
end
24.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_wonderful_wizard_of_oz_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-wonderful-wizard-of-oz/chapters/chapter#{n+1}.html"
  end
end
if the_wonderful_wizard_of_oz_book.persisted?
  puts 'Seeded The Wonderful Wizard of Oz'
end

vanity_fair_book = Book.find_or_create_by(name: 'Vanity Fair') do |book|
  book.author = 'William Makepeace Thackeray'
  book.cover_image_full_s3_key = 'vanity-fair/vanity-fair-full.jpg'
  book.cover_image_thumb_s3_key = 'vanity-fair/vanity-fair-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1853260193?tag=bettermorning-20'
end
67.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: vanity_fair_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "vanity-fair/chapters/chapter#{n+1}.html"
  end
end
if vanity_fair_book.persisted?
  puts 'Seeded Vanity Fair'
end

black_beauty_book = Book.find_or_create_by(name: 'Black Beauty') do |book|
  book.author = 'Anna Sewell'
  book.cover_image_full_s3_key = 'black-beauty/black-beauty-full.jpg'
  book.cover_image_thumb_s3_key = 'black-beauty/black-beauty-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1503251284?tag=bettermorning-20'
end
49.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: black_beauty_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "black-beauty/chapters/chapter#{n+1}.html"
  end
end
if black_beauty_book.persisted?
  puts 'Seeded Black Beauty'
end

romeo_and_juliet_book = Book.find_or_create_by(name: 'Romeo and Juliet') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'romeo-and-juliet/romeo-and-juliet-full.jpg'
  book.cover_image_thumb_s3_key = 'romeo-and-juliet/romeo-and-juliet-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1505259568?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: romeo_and_juliet_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "romeo-and-juliet/chapters/chapter#{n+1}.html"
  end
end
if romeo_and_juliet_book.persisted?
  puts 'Seeded Romeo and Juliet'
end

macbeth_book = Book.find_or_create_by(name: 'Macbeth') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'macbeth/macbeth-full.jpg'
  book.cover_image_thumb_s3_key = 'macbeth/macbeth-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1514630583?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: macbeth_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "macbeth/chapters/chapter#{n+1}.html"
  end
end
if macbeth_book.persisted?
  puts 'Seeded Macbeth'
end

hamlet_book = Book.find_or_create_by(name: 'Hamlet') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'hamlet/hamlet-full.jpg'
  book.cover_image_thumb_s3_key = 'hamlet/hamlet-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B008TVM1JU?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: hamlet_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "hamlet/chapters/chapter#{n+1}.html"
  end
end
if hamlet_book.persisted?
  puts 'Seeded Hamlet'
end

othello_book = Book.find_or_create_by(name: 'Othello') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'othello/othello-full.jpg'
  book.cover_image_thumb_s3_key = 'othello/othello-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1512317764?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: othello_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "othello/chapters/chapter#{n+1}.html"
  end
end
if othello_book.persisted?
  puts 'Seeded Othello'
end

a_midsummer_night_s_dream_book = Book.find_or_create_by(name: 'A Midsummer Night’s Dream') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'a-midsummer-night-s-dream/a-midsummer-night-s-dream-full.jpg'
  book.cover_image_thumb_s3_key = 'a-midsummer-night-s-dream/a-midsummer-night-s-dream-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1503250784?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: a_midsummer_night_s_dream_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "a-midsummer-night-s-dream/chapters/chapter#{n+1}.html"
  end
end
if a_midsummer_night_s_dream_book.persisted?
  puts 'Seeded A Midsummer Night’s Dream'
end

the_merchant_of_venice_book = Book.find_or_create_by(name: 'The Merchant of Venice') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'the-merchant-of-venice/the-merchant-of-venice-full.jpg'
  book.cover_image_thumb_s3_key = 'the-merchant-of-venice/the-merchant-of-venice-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B01GBWSZES?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_merchant_of_venice_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-merchant-of-venice/chapters/chapter#{n+1}.html"
  end
end
if the_merchant_of_venice_book.persisted?
  puts 'Seeded The Merchant of Venice'
end

much_ado_about_nothing_book = Book.find_or_create_by(name: 'Much Ado about Nothing') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'much-ado-about-nothing/much-ado-about-nothing-full.jpg'
  book.cover_image_thumb_s3_key = 'much-ado-about-nothing/much-ado-about-nothing-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B01C4MLTF6?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: much_ado_about_nothing_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "much-ado-about-nothing/chapters/chapter#{n+1}.html"
  end
end
if much_ado_about_nothing_book.persisted?
  puts 'Seeded Much Ado about Nothing'
end

twelfth_night_book = Book.find_or_create_by(name: 'Twelfth Night') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'twelfth-night/twelfth-night-full.jpg'
  book.cover_image_thumb_s3_key = 'twelfth-night/twelfth-night-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B01GBWSZHK?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: twelfth_night_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "twelfth-night/chapters/chapter#{n+1}.html"
  end
end
if twelfth_night_book.persisted?
  puts 'Seeded Twelfth Night'
end

king_lear_book = Book.find_or_create_by(name: 'King Lear') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'king-lear/king-lear-full.jpg'
  book.cover_image_thumb_s3_key = 'king-lear/king-lear-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1952433819?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: king_lear_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "king-lear/chapters/chapter#{n+1}.html"
  end
end
if king_lear_book.persisted?
  puts 'Seeded King Lear'
end

the_taming_of_the_shrew_book = Book.find_or_create_by(name: 'The Taming of the Shrew') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'the-taming-of-the-shrew/the-taming-of-the-shrew-full.jpg'
  book.cover_image_thumb_s3_key = 'the-taming-of-the-shrew/the-taming-of-the-shrew-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08L66TBQ6?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_taming_of_the_shrew_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-taming-of-the-shrew/chapters/chapter#{n+1}.html"
  end
end
if the_taming_of_the_shrew_book.persisted?
  puts 'Seeded The Taming of the Shrew'
end

julius_caesar_book = Book.find_or_create_by(name: 'Julius Caesar') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'julius-caesar/julius-caesar-full.jpg'
  book.cover_image_thumb_s3_key = 'julius-caesar/julius-caesar-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1420952749?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: julius_caesar_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "julius-caesar/chapters/chapter#{n+1}.html"
  end
end
if julius_caesar_book.persisted?
  puts 'Seeded Julius Caesar'
end

the_winter_s_tale_book = Book.find_or_create_by(name: "The Winter's Tale") do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'the-winter-s-tale/the-winter-s-tale-full.jpg'
  book.cover_image_thumb_s3_key = 'the-winter-s-tale/the-winter-s-tale-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B00HTJVQGM?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_winter_s_tale_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-winter-s-tale/chapters/chapter#{n+1}.html"
  end
end
if the_winter_s_tale_book.persisted?
  puts "Seeded The Winter's Tale"
end

the_tempest_book = Book.find_or_create_by(name: 'The Tempest') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'the-tempest/the-tempest-full.jpg'
  book.cover_image_thumb_s3_key = 'the-tempest/the-tempest-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/0198325002?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_tempest_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-tempest/chapters/chapter#{n+1}.html"
  end
end
if the_tempest_book.persisted?
  puts 'Seeded The Tempest'
end

antony_and_cleopatra_book = Book.find_or_create_by(name: 'Antony and Cleopatra') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'antony-and-cleopatra/antony-and-cleopatra-full.jpg'
  book.cover_image_thumb_s3_key = 'antony-and-cleopatra/antony-and-cleopatra-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B075Y18898?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: antony_and_cleopatra_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "antony-and-cleopatra/chapters/chapter#{n+1}.html"
  end
end
if antony_and_cleopatra_book.persisted?
  puts 'Seeded Antony and Cleopatra'
end

as_you_like_it_book = Book.find_or_create_by(name: 'As You Like It') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'as-you-like-it/as-you-like-it-full.jpg'
  book.cover_image_thumb_s3_key = 'as-you-like-it/as-you-like-it-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08NG7WYT2?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: as_you_like_it_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "as-you-like-it/chapters/chapter#{n+1}.html"
  end
end
if as_you_like_it_book.persisted?
  puts 'Seeded As You Like It'
end

richard_iii_book = Book.find_or_create_by(name: 'Richard III') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'richard-iii/richard-iii-full.jpg'
  book.cover_image_thumb_s3_key = 'richard-iii/richard-iii-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1420954628?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: richard_iii_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "richard-iii/chapters/chapter#{n+1}.html"
  end
end
if richard_iii_book.persisted?
  puts 'Seeded Richard III'
end

the_merry_wives_of_windsor_book = Book.find_or_create_by(name: 'The Merry Wives of Windsor') do |book|
  book.author = 'William Shakespeare'
  book.cover_image_full_s3_key = 'the-merry-wives-of-windsor/the-merry-wives-of-windsor-full.jpg'
  book.cover_image_thumb_s3_key = 'the-merry-wives-of-windsor/the-merry-wives-of-windsor-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1699666709?tag=bettermorning-20'
end
5.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_merry_wives_of_windsor_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-merry-wives-of-windsor/chapters/chapter#{n+1}.html"
  end
end
if the_merry_wives_of_windsor_book.persisted?
  puts 'Seeded The Merry Wives of Windsor'
end

the_red_badge_of_courage_book = Book.find_or_create_by(name: 'The Red Badge of Courage') do |book|
  book.author = 'Stephen Crane'
  book.cover_image_full_s3_key = 'the-red-badge-of-courage/the-red-badge-of-courage-full.jpg'
  book.cover_image_thumb_s3_key = 'the-red-badge-of-courage/the-red-badge-of-courage-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08L57P7S9?tag=bettermorning-20'
end
24.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_red_badge_of_courage_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-red-badge-of-courage/chapters/chapter#{n+1}.html"
  end
end
if the_red_badge_of_courage_book.persisted?
  puts 'Seeded The Red Badge of Courage'
end

the_murder_on_the_links_book = Book.find_or_create_by(name: 'The Murder on the Links') do |book|
  book.author = 'Agatha Christie'
  book.cover_image_full_s3_key = 'the-murder-on-the-links/the-murder-on-the-links-full.jpg'
  book.cover_image_thumb_s3_key = 'the-murder-on-the-links/the-murder-on-the-links-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B083QY2GSM?tag=bettermorning-20'
end
28.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_murder_on_the_links_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-murder-on-the-links/chapters/chapter#{n+1}.html"
  end
end
if the_murder_on_the_links_book.persisted?
  puts 'Seeded The Murder on the Links'
end

the_secret_adversary_book = Book.find_or_create_by(name: 'The Secret Adversary') do |book|
  book.author = 'Agatha Christie'
  book.cover_image_full_s3_key = 'the-secret-adversary/the-secret-adversary-full.jpg'
  book.cover_image_thumb_s3_key = 'the-secret-adversary/the-secret-adversary-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1735778931?tag=bettermorning-20'
end
28.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_secret_adversary_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-secret-adversary/chapters/chapter#{n+1}.html"
  end
end
if the_secret_adversary_book.persisted?
  puts 'Seeded The Secret Adversary'
end

the_man_in_the_brown_suit_book = Book.find_or_create_by(name: 'The Man in the Brown Suit') do |book|
  book.author = 'Agatha Christie'
  book.cover_image_full_s3_key = 'the-man-in-the-brown-suit/the-man-in-the-brown-suit-full.jpg'
  book.cover_image_thumb_s3_key = 'the-man-in-the-brown-suit/the-man-in-the-brown-suit-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08MCWGZJ7?tag=bettermorning-20'
end
36.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_man_in_the_brown_suit_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-man-in-the-brown-suit/chapters/chapter#{n+1}.html"
  end
end
if the_man_in_the_brown_suit_book.persisted?
  puts 'Seeded The Man in the Brown Suit'
end

poirot_investigates_book = Book.find_or_create_by(name: 'Poirot Investigates') do |book|
  book.author = 'Agatha Christie'
  book.cover_image_full_s3_key = 'poirot-investigates/poirot-investigates-full.jpg'
  book.cover_image_thumb_s3_key = 'poirot-investigates/poirot-investigates-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08N6J1S8Q?tag=bettermorning-20'
end
11.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: poirot_investigates_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "poirot-investigates/chapters/chapter#{n+1}.html"
  end
end
if poirot_investigates_book.persisted?
  puts 'Seeded Poirot Investigates'
end

twice_told_tales_book = Book.find_or_create_by(name: 'Twice-Told Tales') do |book|
  book.author = 'Nathaniel Hawthorne'
  book.cover_image_full_s3_key = 'twice-told-tales/twice-told-tales-full.jpg'
  book.cover_image_thumb_s3_key = 'twice-told-tales/twice-told-tales-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08KJ2SGSP?tag=bettermorning-20'
end
39.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: twice_told_tales_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "twice-told-tales/chapters/chapter#{n+1}.html"
  end
end
if twice_told_tales_book.persisted?
  puts 'Seeded Twice-Told Tales'
end

the_call_of_the_canyon_book = Book.find_or_create_by(name: 'The Call of the Canyon') do |book|
  book.author = 'Zane Grey'
  book.cover_image_full_s3_key = 'the-call-of-the-canyon/the-call-of-the-canyon-full.jpg'
  book.cover_image_thumb_s3_key = 'the-call-of-the-canyon/the-call-of-the-canyon-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B019P1W4NA?tag=bettermorning-20'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_call_of_the_canyon_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-call-of-the-canyon/chapters/chapter#{n+1}.html"
  end
end
if the_call_of_the_canyon_book.persisted?
  puts 'Seeded The Call of the Canyon'
end

myths_and_legends_of_ancient_greece_and_rome_book = Book.find_or_create_by(name: 'Myths and Legends of Ancient Greece and Rome') do |book|
  book.author = 'E. M. Berens'
  book.cover_image_full_s3_key = 'myths-and-legends-of-ancient-greece-and-rome/myths-and-legends-of-ancient-greece-and-rome-full.jpg'
  book.cover_image_thumb_s3_key = 'myths-and-legends-of-ancient-greece-and-rome/myths-and-legends-of-ancient-greece-and-rome-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08GJDRND9?tag=bettermorning-20'
end
119.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: myths_and_legends_of_ancient_greece_and_rome_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "myths-and-legends-of-ancient-greece-and-rome/chapters/chapter#{n+1}.html"
  end
end
if myths_and_legends_of_ancient_greece_and_rome_book.persisted?
  puts 'Seeded Myths and Legends of Ancient Greece and Rome'
end

middlemarch_book = Book.find_or_create_by(name: 'Middlemarch') do |book|
  book.author = 'George Eliot'
  book.cover_image_full_s3_key = 'middlemarch/middlemarch-full.jpg'
  book.cover_image_thumb_s3_key = 'middlemarch/middlemarch-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B01BG9XSKM?tag=bettermorning-20'
end
86.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: middlemarch_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "middlemarch/chapters/chapter#{n+1}.html"
  end
end
if middlemarch_book.persisted?
  puts 'Seeded Middlemarch'
end

a_gentleman_of_courage_book = Book.find_or_create_by(name: 'A Gentleman of Courage') do |book|
  book.author = 'James Oliver Curwood'
  book.cover_image_full_s3_key = 'a-gentleman-of-courage/a-gentleman-of-courage-full.jpg'
  book.cover_image_thumb_s3_key = 'a-gentleman-of-courage/a-gentleman-of-courage-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B071GLFMG3?tag=bettermorning-20'
end
24.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: a_gentleman_of_courage_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "a-gentleman-of-courage/chapters/chapter#{n+1}.html"
  end
end
if a_gentleman_of_courage_book.persisted?
  puts 'Seeded A Gentleman of Courage'
end

the_oregon_trail_book = Book.find_or_create_by(name: 'The Oregon Trail') do |book|
  book.author = 'Francis Parkman, Jr.'
  book.cover_image_full_s3_key = 'the-oregon-trail/the-oregon-trail-full.jpg'
  book.cover_image_thumb_s3_key = 'the-oregon-trail/the-oregon-trail-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/0199553920?tag=bettermorning-20'
end
27.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_oregon_trail_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-oregon-trail/chapters/chapter#{n+1}.html"
  end
end
if the_oregon_trail_book.persisted?
  puts 'Seeded The Oregon Trail'
end

the_island_of_doctor_moreau_book = Book.find_or_create_by(name: 'The Island of Doctor Moreau') do |book|
  book.author = 'H. G. Wells'
  book.cover_image_full_s3_key = 'the-island-of-doctor-moreau/the-island-of-doctor-moreau-full.jpg'
  book.cover_image_thumb_s3_key = 'the-island-of-doctor-moreau/the-island-of-doctor-moreau-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B085RTJ3SX?tag=bettermorning-20'
end
22.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_island_of_doctor_moreau_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-island-of-doctor-moreau/chapters/chapter#{n+1}.html"
  end
end
if the_island_of_doctor_moreau_book.persisted?
  puts 'Seeded The Island of Doctor Moreau'
end

anthem_book = Book.find_or_create_by(name: 'Anthem') do |book|
  book.author = 'Ayn Rand'
  book.cover_image_full_s3_key = 'anthem/anthem-full.jpg'
  book.cover_image_thumb_s3_key = 'anthem/anthem-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1512092460?tag=bettermorning-20'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: anthem_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "anthem/chapters/chapter#{n+1}.html"
  end
end
if anthem_book.persisted?
  puts 'Seeded Anthem'
end

anarchism_and_other_essays_book = Book.find_or_create_by(name: 'Anarchism and Other Essays') do |book|
  book.author = 'Emma Goldman'
  book.cover_image_full_s3_key = 'anarchism-and-other-essays/anarchism-and-other-essays-full.jpg'
  book.cover_image_thumb_s3_key = 'anarchism-and-other-essays/anarchism-and-other-essays-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1512179299?tag=bettermorning-20'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: anarchism_and_other_essays_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "anarchism-and-other-essays/chapters/chapter#{n+1}.html"
  end
end
if anarchism_and_other_essays_book.persisted?
  puts 'Seeded Anarchism and Other Essays'
end

my_own_story_book = Book.find_or_create_by(name: 'My Own Story') do |book|
  book.author = 'Emmeline Pankhurst'
  book.cover_image_full_s3_key = 'my-own-story/my-own-story-full.jpg'
  book.cover_image_thumb_s3_key = 'my-own-story/my-own-story-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B0855YVDV3?tag=bettermorning-20'
end
21.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: my_own_story_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "my-own-story/chapters/chapter#{n+1}.html"
  end
end
if my_own_story_book.persisted?
  puts 'Seeded My Own Story'
end

the_hound_of_the_baskervilles_book = Book.find_or_create_by(name: 'The Hound of the Baskervilles') do |book|
  book.author = 'Arthur Conan Doyle'
  book.cover_image_full_s3_key = 'the-hound-of-the-baskervilles/the-hound-of-the-baskervilles-full.jpg'
  book.cover_image_thumb_s3_key = 'the-hound-of-the-baskervilles/the-hound-of-the-baskervilles-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B00JDY7ROQ?tag=bettermorning-20'
end
15.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_hound_of_the_baskervilles_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-hound-of-the-baskervilles/chapters/chapter#{n+1}.html"
  end
end
if the_hound_of_the_baskervilles_book.persisted?
  puts 'Seeded The Hound of the Baskervilles'
end

the_return_of_sherlock_holmes_book = Book.find_or_create_by(name: 'The Return of Sherlock Holmes') do |book|
  book.author = 'Arthur Conan Doyle'
  book.cover_image_full_s3_key = 'the-return-of-sherlock-holmes/the-return-of-sherlock-holmes-full.jpg'
  book.cover_image_thumb_s3_key = 'the-return-of-sherlock-holmes/the-return-of-sherlock-holmes-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08P525PVY?tag=bettermorning-20'
end
13.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_return_of_sherlock_holmes_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-return-of-sherlock-holmes/chapters/chapter#{n+1}.html"
  end
end
if the_return_of_sherlock_holmes_book.persisted?
  puts 'Seeded The Return of Sherlock Holmes'
end

his_last_bow_book = Book.find_or_create_by(name: 'His Last Bow') do |book|
  book.author = 'Arthur Conan Doyle'
  book.cover_image_full_s3_key = 'his-last-bow/his-last-bow-full.jpg'
  book.cover_image_thumb_s3_key = 'his-last-bow/his-last-bow-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08N4GPJYH?tag=bettermorning-20'
end
7.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: his_last_bow_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "his-last-bow/chapters/chapter#{n+1}.html"
  end
end
if his_last_bow_book.persisted?
  puts 'Seeded His Last Bow'
end

the_valley_of_fear_book = Book.find_or_create_by(name: 'The Valley of Fear') do |book|
  book.author = 'Arthur Conan Doyle'
  book.cover_image_full_s3_key = 'the-valley-of-fear/the-valley-of-fear-full.jpg'
  book.cover_image_thumb_s3_key = 'the-valley-of-fear/the-valley-of-fear-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08DM5XCHT?tag=bettermorning-20'
end
15.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_valley_of_fear_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-valley-of-fear/chapters/chapter#{n+1}.html"
  end
end
if the_valley_of_fear_book.persisted?
  puts 'Seeded The Valley of Fear'
end

the_sign_of_the_four_book = Book.find_or_create_by(name: 'The Sign of the Four') do |book|
  book.author = 'Arthur Conan Doyle'
  book.cover_image_full_s3_key = 'the-sign-of-the-four/the-sign-of-the-four-full.jpg'
  book.cover_image_thumb_s3_key = 'the-sign-of-the-four/the-sign-of-the-four-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08NVQZ5WX?tag=bettermorning-20'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_sign_of_the_four_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-sign-of-the-four/chapters/chapter#{n+1}.html"
  end
end
if the_sign_of_the_four_book.persisted?
  puts 'Seeded The Sign of the Four'
end

a_study_in_scarlet_book = Book.find_or_create_by(name: 'A Study in Scarlet') do |book|
  book.author = 'Arthur Conan Doyle'
  book.cover_image_full_s3_key = 'a-study-in-scarlet/a-study-in-scarlet-full.jpg'
  book.cover_image_thumb_s3_key = 'a-study-in-scarlet/a-study-in-scarlet-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1774260271?tag=bettermorning-20'
end
14.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: a_study_in_scarlet_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "a-study-in-scarlet/chapters/chapter#{n+1}.html"
  end
end
if a_study_in_scarlet_book.persisted?
  puts 'Seeded A Study in Scarlet'
end

shirley_book = Book.find_or_create_by(name: 'Shirley') do |book|
  book.author = 'Charlotte Bronte'
  book.cover_image_full_s3_key = 'shirley/shirley-full.jpg'
  book.cover_image_thumb_s3_key = 'shirley/shirley-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B01GF0L8HC?tag=bettermorning-20'
end
37.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: shirley_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "shirley/chapters/chapter#{n+1}.html"
  end
end
if shirley_book.persisted?
  puts 'Seeded Shirley'
end

the_wind_in_the_willows_book = Book.find_or_create_by(name: 'The Wind in the Willows') do |book|
  book.author = 'Kenneth Grahame'
  book.cover_image_full_s3_key = 'the-wind-in-the-willows/the-wind-in-the-willows-full.jpg'
  book.cover_image_thumb_s3_key = 'the-wind-in-the-willows/the-wind-in-the-willows-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1402782837?tag=bettermorning-20'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_wind_in_the_willows_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-wind-in-the-willows/chapters/chapter#{n+1}.html"
  end
end
if the_wind_in_the_willows_book.persisted?
  puts 'Seeded The Wind in the Willows'
end

the_trial_book = Book.find_or_create_by(name: 'The Trial') do |book|
  book.author = 'Franz Kafka'
  book.cover_image_full_s3_key = 'the-trial/the-trial-full.jpg'
  book.cover_image_thumb_s3_key = 'the-trial/the-trial-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1451578644?tag=bettermorning-20'
end
10.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_trial_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-trial/chapters/chapter#{n+1}.html"
  end
end
if the_trial_book.persisted?
  puts 'Seeded The Trial'
end

the_great_gatsby_book = Book.find_or_create_by(name: 'The Great Gatsby') do |book|
  book.author = 'F. Scott Fitzgerald'
  book.cover_image_full_s3_key = 'the-great-gatsby/the-great-gatsby-full.jpg'
  book.cover_image_thumb_s3_key = 'the-great-gatsby/the-great-gatsby-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1982149485?tag=bettermorning-20'
end
9.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_great_gatsby_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-great-gatsby/chapters/chapter#{n+1}.html"
  end
end
if the_great_gatsby_book.persisted?
  puts 'Seeded The Great Gatsby'
end

the_yellow_wallpaper_book = Book.find_or_create_by(name: 'The Yellow Wallpaper') do |book|
  book.author = 'Charlotte Perkins Gilman'
  book.cover_image_full_s3_key = 'the-yellow-wallpaper/the-yellow-wallpaper-full.jpg'
  book.cover_image_thumb_s3_key = 'the-yellow-wallpaper/the-yellow-wallpaper-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08XWN6BZ6?tag=bettermorning-20'
end
1.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_yellow_wallpaper_book.id) do |chapter|
    chapter.name = "A Short Story"
    chapter.text_s3_key = "the-yellow-wallpaper/chapters/chapter#{n+1}.html"
  end
end
if the_yellow_wallpaper_book.persisted?
  puts 'Seeded The Yellow Wallpaper'
end

the_strange_case_of_dr_jekyll_and_mr_hyde_book = Book.find_or_create_by(name: 'The Strange Case Of Dr. Jekyll And Mr. Hyde') do |book|
  book.author = 'Robert Louis Stevenson'
  book.cover_image_full_s3_key = 'the-strange-case-of-dr-jekyll-and-mr-hyde/the-strange-case-of-dr-jekyll-and-mr-hyde-full.jpg'
  book.cover_image_thumb_s3_key = 'the-strange-case-of-dr-jekyll-and-mr-hyde/the-strange-case-of-dr-jekyll-and-mr-hyde-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/0451532252?tag=bettermorning-20'
end
10.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_strange_case_of_dr_jekyll_and_mr_hyde_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-strange-case-of-dr-jekyll-and-mr-hyde/chapters/chapter#{n+1}.html"
  end
end
if the_strange_case_of_dr_jekyll_and_mr_hyde_book.persisted?
  puts 'Seeded The Strange Case Of Dr. Jekyll And Mr. Hyde'
end

the_painted_veil_book = Book.find_or_create_by(name: 'The Painted Veil') do |book|
  book.author = 'W. Somerset Maugham'
  book.cover_image_full_s3_key = 'the-painted-veil/the-painted-veil-full.jpg'
  book.cover_image_thumb_s3_key = 'the-painted-veil/the-painted-veil-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B011T77KP0?tag=bettermorning-20'
end
80.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_painted_veil_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-painted-veil/chapters/chapter#{n+1}.html"
  end
end
if the_painted_veil_book.persisted?
  puts 'Seeded The Painted Veil'
end

the_tenant_of_wildfell_hall_book = Book.find_or_create_by(name: 'The Tenant of Wildfell Hall') do |book|
  book.author = 'Anne Bronte'
  book.cover_image_full_s3_key = 'the-tenant-of-wildfell-hall/the-tenant-of-wildfell-hall-full.jpg'
  book.cover_image_thumb_s3_key = 'the-tenant-of-wildfell-hall/the-tenant-of-wildfell-hall-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B07HQYJYL8?tag=bettermorning-20'
end
53.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_tenant_of_wildfell_hall_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-tenant-of-wildfell-hall/chapters/chapter#{n+1}.html"
  end
end
if the_tenant_of_wildfell_hall_book.persisted?
  puts 'Seeded The Tenant of Wildfell Hall'
end

villette_book = Book.find_or_create_by(name: 'Villette') do |book|
  book.author = 'Charlotte Bronte'
  book.cover_image_full_s3_key = 'villette/villette-full.jpg'
  book.cover_image_thumb_s3_key = 'villette/villette-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08Y76VZNT?tag=bettermorning-20'
end
42.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: villette_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "villette/chapters/chapter#{n+1}.html"
  end
end
if villette_book.persisted?
  puts 'Seeded Villette'
end

the_innocence_of_father_brown_book = Book.find_or_create_by(name: 'The Innocence of Father Brown') do |book|
  book.author = 'G. K. Chesterton'
  book.cover_image_full_s3_key = 'the-innocence-of-father-brown/the-innocence-of-father-brown-full.jpg'
  book.cover_image_thumb_s3_key = 'the-innocence-of-father-brown/the-innocence-of-father-brown-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1655527150?tag=bettermorning-20'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_innocence_of_father_brown_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-innocence-of-father-brown/chapters/chapter#{n+1}.html"
  end
end
if the_innocence_of_father_brown_book.persisted?
  puts 'Seeded The Innocence of Father Brown'
end

botchan_book = Book.find_or_create_by(name: 'Botchan') do |book|
  book.author = 'Natsume Soseki'
  book.cover_image_full_s3_key = 'botchan/botchan-full.jpg'
  book.cover_image_thumb_s3_key = 'botchan/botchan-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/4805312637?tag=bettermorning-20'
end
11.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: botchan_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "botchan/chapters/chapter#{n+1}.html"
  end
end
if botchan_book.persisted?
  puts 'Seeded Botchan'
end

behind_a_mask_book = Book.find_or_create_by(name: 'Behind a Mask') do |book|
  book.author = 'Louisa May Alcott'
  book.cover_image_full_s3_key = 'behind-a-mask/behind-a-mask-full.jpg'
  book.cover_image_thumb_s3_key = 'behind-a-mask/behind-a-mask-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/0688151329?tag=bettermorning-20'
end
9.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: behind_a_mask_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "behind-a-mask/chapters/chapter#{n+1}.html"
  end
end
if behind_a_mask_book.persisted?
  puts 'Seeded Behind a Mask'
end

come_out_of_the_kitchen_a_romance_book = Book.find_or_create_by(name: 'Come Out of the Kitchen! A Romance') do |book|
  book.author = 'Alice Duer Miller'
  book.cover_image_full_s3_key = 'come-out-of-the-kitchen-a-romance/come-out-of-the-kitchen-a-romance-full.jpg'
  book.cover_image_thumb_s3_key = 'come-out-of-the-kitchen-a-romance/come-out-of-the-kitchen-a-romance-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B07KQMTW73?tag=bettermorning-20'
end
13.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: come_out_of_the_kitchen_a_romance_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "come-out-of-the-kitchen-a-romance/chapters/chapter#{n+1}.html"
  end
end
if come_out_of_the_kitchen_a_romance_book.persisted?
  puts 'Seeded Come Out of the Kitchen! A Romance'
end

evelina_book = Book.find_or_create_by(name: 'Evelina') do |book|
  book.author = 'Fanny Burney'
  book.cover_image_full_s3_key = 'evelina/evelina-full.jpg'
  book.cover_image_thumb_s3_key = 'evelina/evelina-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B072BW658J?tag=bettermorning-20'
end
84.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: evelina_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "evelina/chapters/chapter#{n+1}.html"
  end
end
if evelina_book.persisted?
  puts 'Seeded Evelina'
end

north_and_south_book = Book.find_or_create_by(name: 'North and South') do |book|
  book.author = 'Elizabeth Gaskell'
  book.cover_image_full_s3_key = 'north-and-south/north-and-south-full.jpg'
  book.cover_image_thumb_s3_key = 'north-and-south/north-and-south-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08XP9WHL3?tag=bettermorning-20'
end
52.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: north_and_south_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "north-and-south/chapters/chapter#{n+1}.html"
  end
end
if north_and_south_book.persisted?
  puts 'Seeded North and South'
end

the_interesting_narrative_of_the_life_of_olaudah_equiano_book = Book.find_or_create_by(name: 'The Interesting Narrative of the Life of Olaudah Equiano') do |book|
  book.author = 'Olaudah Equiano'
  book.cover_image_full_s3_key = 'the-interesting-narrative-of-the-life-of-olaudah-equiano/the-interesting-narrative-of-the-life-of-olaudah-equiano-full.jpg'
  book.cover_image_thumb_s3_key = 'the-interesting-narrative-of-the-life-of-olaudah-equiano/the-interesting-narrative-of-the-life-of-olaudah-equiano-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/0375761152?tag=bettermorning-20'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_interesting_narrative_of_the_life_of_olaudah_equiano_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-interesting-narrative-of-the-life-of-olaudah-equiano/chapters/chapter#{n+1}.html"
  end
end
if the_interesting_narrative_of_the_life_of_olaudah_equiano_book.persisted?
  puts 'Seeded The Interesting Narrative of the Life of Olaudah Equiano'
end

herland_book = Book.find_or_create_by(name: 'Herland') do |book|
  book.author = 'Charlotte Perkins Gilman'
  book.cover_image_full_s3_key = 'herland/herland-full.jpg'
  book.cover_image_thumb_s3_key = 'herland/herland-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B00A73FEWE?tag=bettermorning-20'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: herland_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "herland/chapters/chapter#{n+1}.html"
  end
end
if herland_book.persisted?
  puts 'Seeded Herland'
end

the_home_and_the_world_book = Book.find_or_create_by(name: 'The Home and the World') do |book|
  book.author = 'Rabindranath Tagore'
  book.cover_image_full_s3_key = 'the-home-and-the-world/the-home-and-the-world-full.jpg'
  book.cover_image_thumb_s3_key = 'the-home-and-the-world/the-home-and-the-world-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1540875415?tag=bettermorning-20'
end
12.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_home_and_the_world_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-home-and-the-world/chapters/chapter#{n+1}.html"
  end
end
if the_home_and_the_world_book.persisted?
  puts 'Seeded The Home and the World'
end

around_the_world_in_80_days_book = Book.find_or_create_by(name: 'Around the World in 80 Days') do |book|
  book.author = 'Jules Verne'
  book.cover_image_full_s3_key = 'around-the-world-in-80-days/around-the-world-in-80-days-full.jpg'
  book.cover_image_thumb_s3_key = 'around-the-world-in-80-days/around-the-world-in-80-days-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B08NXN29JB?tag=bettermorning-20'
end
37.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: around_the_world_in_80_days_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "around-the-world-in-80-days/chapters/chapter#{n+1}.html"
  end
end
if around_the_world_in_80_days_book.persisted?
  puts 'Seeded Around the World in 80 Days'
end

a_vindication_of_the_rights_of_woman_book = Book.find_or_create_by(name: 'A Vindication of the Rights of Woman') do |book|
  book.author = 'Mary Wollstonecraft'
  book.cover_image_full_s3_key = 'a-vindication-of-the-rights-of-woman/a-vindication-of-the-rights-of-woman-full.jpg'
  book.cover_image_thumb_s3_key = 'a-vindication-of-the-rights-of-woman/a-vindication-of-the-rights-of-woman-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/B0915Z8PXL?tag=bettermorning-20'
end
13.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: a_vindication_of_the_rights_of_woman_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "a-vindication-of-the-rights-of-woman/chapters/chapter#{n+1}.html"
  end
end
if a_vindication_of_the_rights_of_woman_book.persisted?
  puts 'Seeded A Vindication of the Rights of Woman'
end

benhur_book = Book.find_or_create_by(name: 'Ben-Hur') do |book|
  book.author = 'Lew Wallace'
  book.cover_image_full_s3_key = 'ben-hur/ben-hur-full.jpg'
  book.cover_image_thumb_s3_key = 'ben-hur/ben-hur-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1853262838?tag=bettermorning-20'
end
81.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: benhur_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "ben-hur/chapters/chapter#{n+1}.html"
  end
end
if benhur_book.persisted?
  puts 'Seeded Ben-Hur'
end

ivanhoe_book = Book.find_or_create_by(name: 'Ivanhoe') do |book|
  book.author = 'Sir Walter Scott'
  book.cover_image_full_s3_key = 'ivanhoe/ivanhoe-full.jpg'
  book.cover_image_thumb_s3_key = 'ivanhoe/ivanhoe-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/107993006X?tag=bettermorning-20'
end
44.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: ivanhoe_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "ivanhoe/chapters/chapter#{n+1}.html"
  end
end
if ivanhoe_book.persisted?
  puts 'Seeded Ivanhoe'
end

candide_book = Book.find_or_create_by(name: 'Candide') do |book|
  book.author = 'Voltaire'
  book.cover_image_full_s3_key = 'candide/candide-full.jpg'
  book.cover_image_thumb_s3_key = 'candide/candide-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/dp/1087113490?tag=bettermorning-20'
end
30.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: candide_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "candide/chapters/chapter#{n+1}.html"
  end
end
if candide_book.persisted?
  puts 'Seeded Candide'
end

the_light_of_western_stars_book = Book.find_or_create_by(name: 'The Light of Western Stars') do |book|
  book.author = 'Zane Grey'
  book.cover_image_full_s3_key = 'the-light-of-western-stars/the-light-of-western-stars-full.jpg'
  book.cover_image_thumb_s3_key = 'the-light-of-western-stars/the-light-of-western-stars-thumb.jpg'
  book.amazon_link = 'https://www.amazon.com/Light-Western-Stars-Historical-Literature/dp/B098CW7HNK/ref=sr_1_4?dchild=1&keywords=The+Light+of+Western+Stars+Zane+Grey&qid=1629921332&sr=8-4'
end
25.times do |n|
  Chapter.find_or_create_by(position: n+1, book_id: the_light_of_western_stars_book.id) do |chapter|
    chapter.name = "Chapter #{n+1}"
    chapter.text_s3_key = "the-light-of-western-stars/chapters/chapter#{n+1}.html"
  end
end
if the_light_of_western_stars_book.persisted?
  puts 'Seeded The Light of Western Stars'
end
