class MockRainforest
  def self.search_books
    [
      {
        'title' => 'Pawnee',
        'image' => 'pawnee.jpg',
        'link' => 'http://example.com/pawnee'
      },
      {
        'title' => 'Eagleton',
        'image' => 'eagleton.jpg',
        'link' => 'http://example.com/eagleton'
      },
      {
        'title' => 'Muncie',
        'image' => 'muncie.jpg',
        'link' => 'http://example.com/muncie'
      },
    ]
  end

  def self.product
    {
      'main_image' => {
        'link' => Rails.root.join('spec', 'support', 'fixtures', 'cover.jpg')
      }
    }
  end
end
