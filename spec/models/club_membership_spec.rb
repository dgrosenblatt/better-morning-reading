require 'rails_helper'

RSpec.describe ClubMembership, type: :model do
  describe 'validations' do
    let!(:club_membership) { create(:club_membership) }

    it { should validate_uniqueness_of(:club_id).scoped_to(:user_id) }
  end

  describe 'associations' do
    it { should belong_to(:club) }
    it { should belong_to(:user) }
  end
end
