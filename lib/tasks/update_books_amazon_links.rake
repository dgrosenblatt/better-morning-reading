desc 'Populate early books with amazon links'
task update_books_amazon_links: [:environment] do
  pride = Book.find_by(name: 'Pride and Prejudice')
  pride.amazon_link = 'https://www.amazon.com/gp/product/0141439513/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0141439513&linkId=77255d253571540f1532a84a37f57c06'
  if pride.save
    puts 'Updated Pride and Prejudice'
  else
    puts 'Error updating Pride and Prejudice'
  end

  alice = Book.find_by(name: 'Alice In Wonderland')
  alice.amazon_link = 'https://www.amazon.com/gp/product/B08CJQLT6J/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B08CJQLT6J&linkId=b31d0fddc8179e8159123d5980530429'
  if alice.save
    puts 'Updated Alice In Wonderland'
  else
    puts 'Error updating Alice In Wonderland'
  end

  sherlock = Book.find_by(name: 'The Adventures of Sherlock Holmes')
  sherlock.amazon_link = 'https://www.amazon.com/gp/product/1950435105/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1950435105&linkId=277eaa7fd101355023df194dcd9e9ee2'
  if sherlock.save
    puts 'Updated Sherlock Holmes'
  else
    puts 'Error updating Sherlock Holmes'
  end

  uncle_toms_cabin = Book.find_by(name: "Uncle Tom's Cabin")
  uncle_toms_cabin.amazon_link = 'https://www.amazon.com/gp/product/1679604007/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1679604007&linkId=fc85798f577c6c793f6fecb0f7f6d251'
  if uncle_toms_cabin.save
    puts "Updated Uncle Tom's Cabin"
  else
    puts "Error updating Uncle Tom's Cabin"
  end

  call_of_the_wild = Book.find_by(name: 'The Call of the Wild')
  call_of_the_wild.amazon_link = 'https://www.amazon.com/gp/product/1503302946/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1503302946&linkId=7b0001e3d14767c4f504a1ca894bbd2f'
  if call_of_the_wild.save
    puts 'Updated The Call of the Wild'
  else
    puts 'Error updating The Call of the Wild'
  end

  tale_of_two_cities = Book.find_by(name: 'A Tale of Two Cities')
  tale_of_two_cities.amazon_link = 'https://www.amazon.com/gp/product/1503219704/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1503219704&linkId=3934b72dc294a66c634e80cd6feb1013'
  if tale_of_two_cities.save
    puts 'Updated A Tale of Two Cities'
  else
    puts 'Error updating A Tale of Two Cities'
  end

  frankenstein = Book.find_by(name: 'Frankenstein')
  frankenstein.amazon_link = 'https://www.amazon.com/gp/product/0486282112/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0486282112&linkId=c1727c44b2a2b0d8549fd0206d67d408'
  if frankenstein.save
    puts 'Updated Frankenstein'
  else
    puts 'Error updating Frankenstein'
  end

  moby_dick = Book.find_by(name: 'Moby Dick')
  moby_dick.amazon_link = 'https://www.amazon.com/gp/product/1503280780/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1503280780&linkId=d6c0964dc617466d206a9e380df81331'
  if moby_dick.save
    puts 'Updated Moby Dick'
  else
    puts 'Error updating Moby Dick'
  end

  dorian_gray = Book.find_by(name: 'The Picture of Dorian Gray')
  dorian_gray.amazon_link = 'https://www.amazon.com/gp/product/1515190994/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1515190994&linkId=5aaff25570a20b3bcc192c167077db7f'
  if dorian_gray.save
    puts 'Updated The Picture of Dorian Gray'
  else
    puts 'Error updating The Picture of Dorian Gray'
  end

  walden = Book.find_by(name: 'Walden')
  walden.amazon_link = 'https://www.amazon.com/gp/product/B002QBNVFW/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B002QBNVFW&linkId=077fb918b7f64186bfb9e46c6621f3e9'
  if walden.save
    puts 'Updated Walden'
  else
    puts 'Error updating Walden'
  end

  magnificent_ambersons = Book.find_by(name: 'The Magnificent Ambersons')
  magnificent_ambersons.amazon_link = 'https://www.amazon.com/gp/product/1420964798/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1420964798&linkId=3f3489fcb7539ae47cfbb25cde16f60d'
  if magnificent_ambersons.save
    puts 'Updated The Magnificent Ambersons'
  else
    puts 'Error updating The Magnificent Ambersons'
  end

  peter_and_wendy = Book.find_by(name: 'Peter and Wendy')
  peter_and_wendy.amazon_link = 'https://www.amazon.com/gp/product/B08929Z9QC/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B08929Z9QC&linkId=76afbd8a886e64b9db76662519d96df7'
  if peter_and_wendy.save
    puts 'Updated Peter and Wendy'
  else
    puts 'Error updating Peter and Wendy'
  end

  wuthering_heights = Book.find_by(name: 'Wuthering Heights')
  wuthering_heights.amazon_link = 'https://www.amazon.com/gp/product/0141439556/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0141439556&linkId=0fc3d3c9892f99e8e0207a33f24de88c'
  if wuthering_heights.save
    puts 'Updated Wuthering Heights'
  else
    puts 'Error updating Wuthering Heights'
  end

  charlotte_temple = Book.find_by(name: 'Charlotte Temple')
  charlotte_temple.amazon_link = 'https://www.amazon.com/gp/product/B08BVWTCF2/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B08BVWTCF2&linkId=72bc0af747730d185bbb0c829d4df864'
  if charlotte_temple.save
    puts 'Updated Charlotte Temple'
  else
    puts 'Error updating Charlotte Temple'
  end

  heart_of_darkness = Book.find_by(name: 'Heart of Darkness')
  heart_of_darkness.amazon_link = 'https://www.amazon.com/gp/product/1673303056/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1673303056&linkId=fce20afa710db47328792b635429f828'
  if heart_of_darkness.save
    puts 'Updated Heart of Darkness'
  else
    puts 'Error updating Heart of Darkness'
  end

  jane_eyre = Book.find_by(name: 'Jane Eyre')
  jane_eyre.amazon_link = 'https://www.amazon.com/gp/product/0553211404/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0553211404&linkId=87c13f36dc194fd6f23a7b8b31880c9c'
  if jane_eyre.save
    puts 'Updated Jane Eyre'
  else
    puts 'Error updating Jane Eyre'
  end

  lady_roses_daughter = Book.find_by(name: "Lady Rose's Daughter")
  lady_roses_daughter.amazon_link = 'https://www.amazon.com/gp/product/B00849JDCK/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B00849JDCK&linkId=99751485bac32ecc9e3f3ce13a649e2b'
  if lady_roses_daughter.save
    puts "Updated Lady Rose's Daughter"
  else
    puts "Error updating Lady Rose's Daughter"
  end

  mysterious_affair = Book.find_by(name: "The Mysterious Affair at Styles")
  mysterious_affair.amazon_link = 'https://www.amazon.com/gp/product/0525565108/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0525565108&linkId=ac773e712b638b9dc7ecdff587a43e88'
  if mysterious_affair.save
    puts "Updated The Mysterious Affair at Styles"
  else
    puts "Error updating The Mysterious Affair at Styles"
  end

  metamorph = Book.find_by(name: "Metamorphosis")
  metamorph.amazon_link = 'https://www.amazon.com/gp/product/1505297052/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1505297052&linkId=2ce1f05cc7382818fe50fc80214948f8'
  if metamorph.save
    puts "Updated Metamorphosis"
  else
    puts "Error updating Metamorphosis"
  end

  ulysses = Book.find_by(name: "Ulysses")
  ulysses.amazon_link = 'https://www.amazon.com/gp/product/1690840277/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1690840277&linkId=2c7029551385eb3312219d2d05ece785'
  if ulysses.save
    puts "Updated Ulysses"
  else
    puts "Error updating Ulysses"
  end

  cane = Book.find_by(name: "Cane")
  cane.amazon_link = 'https://www.amazon.com/gp/product/0871402106/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0871402106&linkId=7214b5a1bfeed736cd8a3de186a3f0df'
  if cane.save
    puts "Updated Cane"
  else
    puts "Error updating Cane"
  end

  riders_of_the_purple_sage = Book.find_by(name: "Riders of the Purple Sage")
  riders_of_the_purple_sage.amazon_link = 'https://www.amazon.com/gp/product/B086B72RL3/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B086B72RL3&linkId=48fa0ba449f70de6e77e7cb0f48bdbe8'
  if riders_of_the_purple_sage.save
    puts "Updated Riders of the Purple Sage"
  else
    puts "Error updating Riders of the Purple Sage"
  end

  the_jungle = Book.find_by(name: "The Jungle")
  the_jungle.amazon_link = 'https://www.amazon.com/gp/product/1514651009/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1514651009&linkId=6145039cb0117cd6da8f63ec937c620c'
  if the_jungle.save
    puts "Updated The Jungle"
  else
    puts "Error updating The Jungle"
  end

  winesburg_ohio = Book.find_by(name: "Winesburg, Ohio")
  winesburg_ohio.amazon_link = 'https://www.amazon.com/gp/product/B083XNNVQ2/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B083XNNVQ2&linkId=3d1fe7d213555cbd67622bb2b396e3b2'
  if winesburg_ohio.save
    puts "Updated Winesburg, Ohio"
  else
    puts "Error updating Winesburg, Ohio"
  end

  tom_sawyer = Book.find_by(name: "The Adventures of Tom Sawyer")
  tom_sawyer.amazon_link = 'https://www.amazon.com/gp/product/0553211285/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0553211285&linkId=5060f1234b2af1180536eaba18c9586e'
  if tom_sawyer.save
    puts "Updated The Adventures of Tom Sawyer"
  else
    puts "Error updating The Adventures of Tom Sawyer"
  end

  dracula_bram_stoker = Book.find_by(name: "Dracula")
  dracula_bram_stoker.amazon_link = 'https://www.amazon.com/gp/product/1076157335/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1076157335&linkId=de6464078017e627a6a0f381ff5ab0df'
  if dracula_bram_stoker.save
    puts "Updated Dracula"
  else
    puts "Error updating Dracula"
  end

  huck_finn = Book.find_by(name: "Adventures of Huckleberry Finn")
  huck_finn.amazon_link = 'https://www.amazon.com/gp/product/1080829636/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1080829636&linkId=d505cf6f2ce7f8beb94adf3ac84f3a00'
  if huck_finn.save
    puts "Updated Adventures of Huckleberry Finn"
  else
    puts "Error updating Adventures of Huckleberry Finn"
  end

  little_women = Book.find_by(name: "Little Women")
  little_women.amazon_link = 'https://www.amazon.com/gp/product/1950435091/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1950435091&linkId=bf03fcb258762262a0f1752a49892022'
  if little_women.save
    puts "Updated Little Women"
  else
    puts "Error updating Little Women"
  end

  emma_jane_austen = Book.find_by(name: "Emma")
  emma_jane_austen.amazon_link = 'https://www.amazon.com/gp/product/1514696886/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1514696886&linkId=399db3733a1a8d33fb9815b011853a58'
  if emma_jane_austen.save
    puts "Updated Emma"
  else
    puts 'Error updating Emma'
  end

  sense_and_sensibility = Book.find_by(name: "Sense and Sensibility")
  sense_and_sensibility.amazon_link = 'https://www.amazon.com/gp/product/151469106X/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=151469106X&linkId=d0124e6ce6982df3a640638b57487ef3'
  if sense_and_sensibility.save
    puts "Updated Sense and Sensibility"
  else
    puts "Error updating Sense and Sensibility"
  end

  house_of_mirth = Book.find_by(name: "The House of Mirth")
  house_of_mirth.amazon_link = 'https://www.amazon.com/gp/product/0140187294/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=0140187294&linkId=dbf860c42ad8f0366dec3b9caa48719f'
  if house_of_mirth.save
    puts "Updated The House of Mirth"
  else
    puts "Error updating The House of Mirth"
  end

  room_with_a_view = Book.find_by(name: "A Room with a View")
  room_with_a_view.amazon_link = 'https://www.amazon.com/gp/product/1949982750/ref=as_li_tl?ie=UTF8&tag=bettermorning-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=1949982750&linkId=0f193fbf4773148632d2e4cd42f86a6e'
  if room_with_a_view.save
    puts "Updated A Room with a View"
  else
    puts "Error updating A Room with a View"
  end

  passage_to_india = Book.find_by(name: "A Passage To India")
  passage_to_india.amazon_link = 'https://www.amazon.com/gp/product/0156711427/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0156711427&linkCode=as2&tag=bettermorning-20&linkId=a3f52df176b5e9e0958451eb4757358e'
  if passage_to_india.save
    puts "Updated A Passage To India"
  else
    puts "Error updating A Passage To India"
  end

  garden_party = Book.find_by(name: "The Garden Party and Other Stories")
  garden_party.amazon_link = 'https://www.amazon.com/gp/product/1420967770/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1420967770&linkCode=as2&tag=bettermorning-20&linkId=5d55a0ab59dc5913de28cb3bd27de12b'
  if garden_party.save
    puts "Updated The Garden Party and Other Stories"
  else
    puts "Error updating The Garden Party and Other Stories"
  end

  main_street = Book.find_by(name: "Main Street")
  main_street.amazon_link = 'https://www.amazon.com/gp/product/109559799X/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=109559799X&linkCode=as2&tag=bettermorning-20&linkId=012b7eb64afab9ede1e8430a0b123f01'
  if main_street.save
    puts "Updated Main Street"
  else
    puts "Error updating Main Street"
  end

  this_side_of_paradise = Book.find_by(name: "This Side of Paradise")
  this_side_of_paradise.amazon_link = 'https://www.amazon.com/gp/product/1500982318/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1500982318&linkCode=as2&tag=bettermorning-20&linkId=8175e513367eb292263e1ed46203e373'
  if this_side_of_paradise.save
    puts "Updated This Side of Paradise"
  else
    puts "Error updating This Side of Paradise"
  end

  the_age_of_innocence = Book.find_by(name: "The Age of Innocence")
  the_age_of_innocence.amazon_link = 'https://www.amazon.com/gp/product/1514639211/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1514639211&linkCode=as2&tag=bettermorning-20&linkId=353a680c983a26cb147ff0587f84def9'
  if the_age_of_innocence.save
    puts "Updated The Age of Innocence"
  else
    puts "Error updating The Age of Innocence"
  end

  twelve_years_a_slave = Book.find_by(name: "12 Years a Slave")
  twelve_years_a_slave.amazon_link = 'https://www.amazon.com/gp/product/1631680021/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1631680021&linkCode=as2&tag=bettermorning-20&linkId=741e570b7a90cc6953ee940b80c6c1cb'
  if twelve_years_a_slave.save
    puts 'Updated 12 Years a Slave'
  else
    puts 'Error updating 12 Years a Slave'
  end

  war_of_the_worlds = Book.find_by(name: "The War of the Worlds")
  war_of_the_worlds.amazon_link = 'https://www.amazon.com/gp/product/B085RSFL4C/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B085RSFL4C&linkCode=as2&tag=bettermorning-20&linkId=fd3530a7ef9fa6f08533bc97af081e69'
  if war_of_the_worlds.save
    puts 'Updated War of the Worlds'
  else
    puts 'Error updating War of the Worlds'
  end

  anne_of_green_gables = Book.find_by(name: "Anne of Green Gables")
  anne_of_green_gables.amazon_link = 'https://www.amazon.com/gp/product/055321313X/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=055321313X&linkCode=as2&tag=bettermorning-20&linkId=83fb0d3dc533a3bcaf2aba9d007d5e83'
  if anne_of_green_gables.save
    puts 'Updated Anne of Green Gables'
  else
    puts 'Error updating Anne of Green Gables'
  end
end
