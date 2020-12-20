require 'rails_helper'

RSpec.describe Club, type: :model do
  describe 'validations' do
    let!(:club) { create(:club) }

    it { should validate_presence_of(:passcode) }
    it { should validate_uniqueness_of(:passcode) }
    it { should validate_presence_of(:status) }
  end

  describe 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:organizer).class_name('User') }
    it { should have_many(:club_memberships) }
    it { should have_many(:users).through(:club_memberships) }
    it { should have_many(:scheduled_club_emails) }
  end

  describe 'instance methods' do
    describe '#add_member' do
      context 'with the correct passcode' do
        it 'adds a free user to a club and returns true' do
          passcode = 'ABC-123'
          club = create(:club, passcode: passcode)
          user = create(:user)

          result = club.add_member(user: user, passcode: passcode)

          expect(result).to eq true

          club.reload
          expect(club.users).to include user
        end

        it 'adds a member with finished clubs and subscriptions' do
          member = create(:user, :with_full_access)
          create(:club, organizer: member, status: 'done')
          create(:subscription, user: member, status: 'done')
          club = create(:club)

          result = club.add_member(user: member, passcode: club.passcode)

          expect(result).to eq true

          club.reload
          expect(club.users).to include member
        end
      end

      context 'when user is already a club member' do
        it 'does nothing and returns false' do
          passcode = 'ABC-123'
          club = create(:club, passcode: passcode)
          user = create(:user)
          club.add_member(user: user, passcode: passcode)

          result = club.add_member(user: user, passcode: passcode)

          expect(result).to eq false

          club.reload

          # (organizer and user)
          expect(club.users.length).to eq 2
        end
      end

      context 'with the wrong passcode' do
        it 'returns false' do
          club = create(:club, passcode: 'passcode')
          user = create(:user)

          result = club.add_member(user: user, passcode: 'wrong-code')

          expect(result).to eq false

          club.reload
          expect(club.users).not_to include user
        end
      end

      context 'with done status' do
        it 'does nothing and returns false' do
          club = create(:club, status: 'done')
          user = create(:user)

          result = club.add_member(user: user, passcode: club.passcode)

          expect(result).to eq false

          club.reload
          expect(club.users).not_to include user
        end
      end

      context 'book access exhausted' do
        context 'when free user already had a subscription' do
          it 'does nothing and returns false' do
            club = create(:club)
            user = create(:user)
            create(:subscription, user: user, status: 'done')

            result = club.add_member(user: user, passcode: club.passcode)

            expect(result).to eq false

            club.reload
            expect(club.users).not_to include user
          end
        end

        context 'when free user already joined a club' do
          it 'does nothing and returns false' do
            first_club = create(:club)
            user = create(:user)
            first_club.add_member(user: user, passcode: first_club.passcode)
            first_club.update(status: 'done')
            club = create(:club)

            result = club.add_member(user: user, passcode: club.passcode)

            expect(result).to eq false

            club.reload
            expect(club.users).not_to include user
          end
        end

        context 'when member already has active subscription' do
          it 'does nothing and returns false' do
            club = create(:club)
            member = create(:user, :with_full_access)
            create(:subscription, user: member, status: 'active')

            result = club.add_member(user: member, passcode: club.passcode)

            expect(result).to eq false

            club.reload
            expect(club.users).not_to include member
          end
        end

        context 'when member already has active club' do
          it 'does nothing and returns false' do
            active_club = create(:club, status: 'active')
            member = create(:user, :with_full_access)
            active_club.add_member(user: member, passcode: active_club.passcode)

            club = create(:club)
            result = club.add_member(user: member, passcode: club.passcode)

            expect(result).to eq false
            club.reload
            expect(club.users).not_to include member
          end
        end

        context 'when member already has an enrolling club' do
          it 'does nothing and returns false' do
            enrolling_club = create(:club, status: 'enrolling')
            member = create(:user, :with_full_access)
            enrolling_club.add_member(user: member, passcode: enrolling_club.passcode)

            club = create(:club)
            result = club.add_member(user: member, passcode: club.passcode)

            expect(result).to eq false
            club.reload
            expect(club.users).not_to include member
          end
        end
      end
    end
  end

  describe 'custom validations' do
    describe 'one or more days' do
      it 'is valid when at least one day is selected' do
        club = build(:club, sunday: true)
        expect(club.valid?).to eq true
      end

      it 'is invalid when no days selected' do
        club = build(:club,
          sunday: false,
          monday: false,
          tuesday: false,
          wednesday: false,
          thursday: false,
          friday: false,
          saturday: false
        )
        expect(club.valid?).to eq false
      end
    end

    describe 'only one for free account organizer' do
      it 'is valid when free user has no clubs or subscriptions' do
        user = create(:user)
        club = build(:club, organizer: user)

        expect(club).to be_valid
      end

      it 'is invalid when free user already has any club' do
        user = create(:user)
        old_club = create(:club, organizer: user)
        club = build(:club, organizer: user)

        expect(club).not_to be_valid
      end

      it 'is invalid when free user already has any subscription' do
        user = create(:user)
        create(:subscription, user: user)
        club = build(:club, organizer: user)

        expect(club).not_to be_valid
      end
    end

    describe 'only one active for member' do
      it 'is valid when organizer has no clubs or subscriptions' do
        member = create(:user, :with_full_access)
        club = build(:club, organizer: member)

        expect(club).to be_valid
      end

      it 'is valid when organizer has finished clubs and subscriptions' do
        member = create(:user, :with_full_access)
        create(:club, organizer: member, status: 'done')
        create(:subscription, user: member, status: 'done')
        club = build(:club, organizer: member)

        expect(club).to be_valid
      end

      it 'is invalid when organizer already has an active club' do
        member = create(:user, :with_full_access)
        create(:club, organizer: member, status: 'active')
        club = build(:club, organizer: member)

        expect(club).not_to be_valid
      end

      it 'is invalid when organizer already has an enrolling club' do
        member = create(:user, :with_full_access)
        create(:club, organizer: member, status: 'enrolling')
        club = build(:club, organizer: member)

        expect(club).not_to be_valid
      end

      it 'is invalid when organizer already has an active subscription' do
        member = create(:user, :with_full_access)
        create(:subscription, user: member, status: 'active')
        club = build(:club, organizer: member)

        expect(club).not_to be_valid
      end
    end
  end

  describe 'commit hooks' do
    describe 'create' do
      it 'should create a scheduled club email for each chapter' do
        user = create(:user)
        book = create(:book)
        3.times { |n| create(:chapter, book: book, position: n) }

        club = create(:club, organizer: user, book: book, status: 'ready')

        emails = club.scheduled_club_emails.order(:position)

        expect(emails.length).to eq 3
        expect(emails[0].chapter_id).to eq book.chapters.first.id
        expect(emails[1].chapter_id).to eq book.chapters.second.id
        expect(emails[2].chapter_id).to eq book.chapters.third.id
      end

      it 'should create a club_membership for the organizer' do
        user = create(:user)
        club = create(:club, organizer: user)

        memberships = club.club_memberships

        expect(memberships.length).to eq 1
        expect(memberships[0].user_id).to eq user.id
      end

      it 'should populate club passcode when missing' do
        user = create(:user)
        club = create(:club, organizer: user)

        expect(club.passcode).to be_present
      end

      it 'should keep club passcode when provided' do
        user = create(:user)
        book = create(:book)

        club = Club.create(organizer: user, book: book, status: 'ready', passcode: 'ABC-123')

        expect(club.passcode).to eq 'ABC-123'
      end
    end
  end
end
