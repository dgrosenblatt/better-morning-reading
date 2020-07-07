class Subscription < ApplicationRecord
  STATUSES = ['active', 'paused', 'done']
  after_commit :populate_scheduled_chapter_emails, on: :create

  # validations
  # unique book scoped to user
  # one active per user

  belongs_to :book
  belongs_to :user
  has_many :scheduled_chapter_emails

  def populate_scheduled_chapter_emails
    Subscription.transaction do
      # TODO: batch insert?
      book.chapters.each do |chapter|
        ScheduledChapterEmail.create!(subscription: self, chapter: chapter)
      end
    end
  end
end
