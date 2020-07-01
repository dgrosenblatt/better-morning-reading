require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user) { create(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }

    describe 'email format' do
      it 'is invalid when it does not contain an @ character' do
        invalid_email_user = build(:user, email: 'fake')

        expect(invalid_email_user.valid?).to eq(false)
        expect(invalid_email_user.errors.messages[:email])
          .to eq(['must be a valid email'])
      end
    end
  end
end
