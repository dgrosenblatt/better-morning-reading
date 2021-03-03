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

          expect(subscription).to be_valid
        end

        it 'is valid when free user has no subscription' do
          user = create(:user)
          subscription = build(:subscription, user: user, status: 'active')

          expect(subscription).to be_valid
        end

        it 'is invalid when free user already has a subscription' do
          user = create(:user)
          create(:subscription, user: user, status: 'done')
          subscription = build(:subscription, user: user, status: 'active')

          expect(subscription).not_to be_valid
        end

        it 'is invalid when free user already has a club' do
          user = create(:user)
          club = create(:club)
          club.add_member(user: user, passcode: club.passcode)
          subscription = build(:subscription, user: user, status: 'active')

          expect(subscription).not_to be_valid
        end
      end

      describe 'only one active for user' do
        it 'is valid when member has no active subscription or club' do
          member = create(:user, :with_full_access)
          subscription = build(:subscription, user: member, status: 'active')

          expect(subscription).to be_valid
        end

        it 'is valid when member has a finished subscriptions and clubs' do
          member = create(:user, :with_full_access)
          create(:subscription, user: member, status: 'done')
          create(:club, organizer: member, status: 'done')

          subscription = build(:subscription, user: member, status: 'active')

          expect(subscription).to be_valid
        end

        it 'is invalid when member already has an active subscription' do
          member = create(:user, :with_full_access)
          create(:subscription, user: member, status: 'active')
          subscription = build(:subscription, user: member, status: 'active')

          expect(subscription).not_to be_valid
        end

        it 'is invalid when member already has an active club' do
          member = create(:user, :with_full_access)
          create(:club, organizer: member, status: 'active')
          subscription = build(:subscription, user: member, status: 'active')

          expect(subscription).not_to be_valid
        end

        it 'is invalid when member already has an enrolling club' do
          member = create(:user, :with_full_access)
          create(:club, organizer: member, status: 'enrolling')
          subscription = build(:subscription, user: member, status: 'active')

          expect(subscription).not_to be_valid
        end
      end
    end
  end

  describe 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
    it { should have_many(:scheduled_chapter_emails) }
  end
end
