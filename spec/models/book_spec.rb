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
end
