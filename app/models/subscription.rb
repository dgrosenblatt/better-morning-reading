class Subscription < ApplicationRecord
  STATUSES = { active: 'active', done: 'done' }
  after_commit :populate_scheduled_chapter_emails, on: :create

  validates :user_id, uniqueness: { scope: :book_id }
  validate :only_one_active_for_user
  validate :only_one_for_free_account_user
  validate :one_or_more_days

  belongs_to :book
  belongs_to :user
  has_many :scheduled_chapter_emails

  # commit hooks
  def populate_scheduled_chapter_emails
    Subscription.transaction do
      # TODO: batch insert?
      book.chapters.each do |chapter|
        ScheduledChapterEmail.create!(subscription: self, chapter: chapter)
      end
    end
  end

  # custom validations
  def one_or_more_days
    any_days = [sunday, monday, tuesday, wednesday, thursday, friday, saturday].any? do |day|
      day == true
    end

    unless any_days
      errors.add(:user, 'must select at least one day')
    end
  end

  def only_one_active_for_user
    if user.active_subscription.present?
      errors.add(:user, 'already reading a book')
    end
  end

  def only_one_for_free_account_user
    if !user.has_full_access && user.subscriptions.any?
      errors.add(:user, 'needs to become a member to read another book')
    end
  end
end
