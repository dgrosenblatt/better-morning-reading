require 'rails_helper'

RSpec.describe ScheduledClubEmail, type: :model do
  describe 'associations' do
    it { should belong_to(:chapter) }
    it { should belong_to(:club) }
  end

  describe 'validations' do
    it { should validate_presence_of(:position) }
  end
end
