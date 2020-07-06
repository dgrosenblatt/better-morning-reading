require 'rails_helper'

RSpec.describe Chapter, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:text_s3_key) }
  end

  describe 'associations' do
    it { should belong_to(:book) }
  end
end
