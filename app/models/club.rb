class Club < ApplicationRecord
  STATUSES = { enrolling: 'enrolling', active: 'active', done: 'done' }

  before_validation :populate_passcode, on: :create
  after_commit :populate_scheduled_club_emails, on: :create
  after_commit :add_organizer_to_members, on: :create

  validates :passcode, presence: true, uniqueness: true
  validates :status, presence: true
  validate :one_or_more_days
  validate :only_one_for_free_account_organizer, on: :create
  validate :only_one_active_for_member, on: :create

  belongs_to :book
  belongs_to :organizer, class_name: 'User'
  has_many :club_memberships
  has_many :users, through: :club_memberships
  has_many :scheduled_club_emails

  # instance methods
  def add_member(user:, passcode:)
    # this should be only entry point to joining a club
    return false if status == Club::STATUSES[:done]
    return false if passcode != self.passcode
    return false if !user.has_full_access && user.subscriptions.any?
    return false if !user.has_full_access && user.clubs.any?
    return false if user.active_subscription.present?
    return false if user.enrolling_club.present?
    return false if user.active_club.present?

    club_membership = ClubMembership.new(user: user, club: self)
    club_membership.save
  end

  # custom validations
  def one_or_more_days
    any_days = [sunday, monday, tuesday, wednesday, thursday, friday, saturday].any? do |day|
      day == true
    end

    unless any_days
      errors.add(:base, 'At least one day must be selected')
    end
  end

  def only_one_for_free_account_organizer
    return if organizer.blank?
    return if organizer.has_full_access

    if organizer.clubs.any? || organizer.subscriptions.any?
      errors.add(:base, 'You must become a member to read another book')
    end
  end

  def only_one_active_for_member
    return if organizer.blank?
    return if !organizer.has_full_access

    if organizer.active_subscription.present? || organizer.active_club.present? || organizer.enrolling_club.present?
      errors.add(:base, 'You are already reading a book')
    end
  end

  # commit hooks
  def populate_scheduled_club_emails
    Club.transaction do
      # TODO: batch insert?
      book.chapters.each do |chapter|
        ScheduledClubEmail.create!(
          club: self,
          chapter: chapter,
          position: chapter.position
        )
      end
    end
  end

  def add_organizer_to_members
    add_member(user: organizer, passcode: self.passcode)
  end

  def populate_passcode
    return if self.passcode.present?
    return if book.blank?

    unique = false
    while !unique do
      prefix = book.name.parameterize
      suffix = SecureRandom.hex(3)
      passcode = "#{prefix}-#{suffix}"

      if Club.where(passcode: passcode).empty?
        self.passcode = passcode
        unique = true
      end
    end
  end
end
