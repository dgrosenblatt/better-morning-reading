require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:cover_image_thumb_s3_key) }
    it { should validate_presence_of(:cover_image_full_s3_key) }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:chapters) }
  end

  describe 'instance methods' do
    describe '#amazon_url' do
      context 'when amazon_link is present' do
        it 'returns amazon_link' do
          amazon_link = 'http://example.com/amazon_link'
          book = create(:book, amazon_link: amazon_link)
          expect(book.amazon_url).to eq amazon_link
        end
      end

      context 'when amazon_link is nil' do
        it 'returns a link to amazon with the book name as a query param' do
          book = create(:book, name: 'Pride and Prejudice', amazon_link: nil)
          expect(book.amazon_url).to eq 'https://www.amazon.com/s?k=Pride%20and%20Prejudice'
        end
      end
    end
  end
end
