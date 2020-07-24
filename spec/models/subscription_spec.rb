require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    let!(:subscription) { create(:subscription) }

    describe 'custom validations' do
      describe 'one or more days' do
        it 'is valid when at least one day is selected' do
          subscription = build(:subscription, sunday: true)
          expect(subscription.valid?).to eq true
        end

        it 'is invalid when no days selected' do
          subscription = build(:subscription,
            sunday: false,
            monday: false,
            tuesday: false,
            wednesday: false,
            thursday: false,
            friday: false,
            saturday: false
          )
          expect(subscription.valid?).to eq false
        end
      end

      describe 'only one for free account user' do
        it 'is valid when user has full access' do
          user = create(:user, :with_full_access)
          create(:subscription, user: user, status: 'done')
          subscription = build(:subscription, user: user, status: 'active')

          expect(subscription.valid?).to eq true
        end

        it 'is valid when free user has no subscription' do
          user = create(:user)
          subscription = build(:subscription, user: user, status: 'active')

          expect(subscription.valid?).to eq true
        end

        it 'is invalid when free user already has a subscription' do
          user = create(:user)
          create(:subscription, user: user, status: 'done')
          subscription = build(:subscription, user: user, status: 'active')

          expect(subscription.valid?).to eq false
        end
      end
    end
  end

  describe 'associations' do
    it { should have_many(:scheduled_chapter_emails) }
  end
end
