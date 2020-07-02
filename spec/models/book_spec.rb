require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:coverImageThumbS3Key) }
    it { should validate_presence_of(:coverImageFullS3Key) }
    it { should validate_presence_of(:name) }
  end
end
