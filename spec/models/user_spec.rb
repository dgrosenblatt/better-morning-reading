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

  describe 'associations' do
    it { should have_many(:subscriptions) }
    it { should have_one(:stripe_customer_subscription) }

    describe 'active_subscription' do
      it 'returns a users subscription with active status when present' do
        user = create(:user)
        create(:subscription, user: user, status: 'done')
        subscription = create(:subscription, user: user, status: 'active')

        expect(user.active_subscription).to eq subscription
      end

      it 'returns nil when no subscription with active status' do
        user = create(:user)
        create(:subscription, user: user, status: 'done')
        create(:subscription, user: user, status: 'done')

        expect(user.active_subscription).to eq nil
      end
    end
  end

  describe 'instance methods' do
    describe '#membership_type' do
      it 'returns "Full Access" when has_full_access is true' do
        user = create(:user, has_full_access: true)
        expect(user.membership_type).to eq 'Full Access'
      end

      it 'returns "Free Account" when has_full_access is false' do
        user = create(:user, has_full_access: false)
        expect(user.membership_type).to eq 'Free Account'
      end
    end

    describe '#exhausted_free_account?' do
      it 'returns true when user has free account with one subscription done' do
        user = create(:user, has_full_access: false)
        create(:subscription, user: user, status: 'done')

        expect(user.exhausted_free_account?).to eq true
      end

      it 'returns true when user has free account with multiple subscriptions done' do
        # i.e. paid account expired
        user = create(:user, has_full_access: true)
        create(:subscription, user: user, status: 'done')
        create(:subscription, user: user, status: 'done')
        user.update(has_full_access: false)

        expect(user.exhausted_free_account?).to eq true
      end

      it 'returns false when user has free account and no subscriptions' do
        user = create(:user, has_full_access: false)
        expect(user.exhausted_free_account?).to eq false
      end

      it 'returns false when user has free account and one active subscription' do
        user = create(:user, has_full_access: false)
        create(:subscription, user: user, status: 'active')

        expect(user.exhausted_free_account?).to eq false
      end

      it 'returns false when user has paid account and all subscriptions done' do
        user = create(:user, has_full_access: true)
        create(:subscription, user: user, status: 'done')
        create(:subscription, user: user, status: 'done')
        create(:subscription, user: user, status: 'done')

        expect(user.exhausted_free_account?).to eq false
      end
    end
  end
end
