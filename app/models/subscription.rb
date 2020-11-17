class Subscription < ApplicationRecord
  STATUSES = { active: 'active', done: 'done' }
  after_commit :populate_scheduled_chapter_emails, on: :create

  validates :book_id, uniqueness: { scope: :user_id, message: 'is already being read' }
  validate :one_or_more_days
  validate :only_one_active_for_user, on: :create
  validate :only_one_for_free_account_user, on: :create

  belongs_to :book
  belongs_to :user
  has_many :scheduled_chapter_emails

  # commit hooks
  def populate_scheduled_chapter_emails
    Subscription.transaction do
      # TODO: batch insert?
      book.chapters.each do |chapter|
        ScheduledChapterEmail.create!(
          subscription: self,
          chapter: chapter,
          position: chapter.position
        )
      end
    end
  end

  def quick_start!
    scheduled_chapter_email = scheduled_chapter_emails.find_by(position: 1)
    chapter = scheduled_chapter_email.chapter
    message = {
      recipient: user.email,
      book_name: book.name,
      is_free_account: !user.has_full_access,
      chapter_name: chapter.name,
      chapter_s3_key: chapter.text_s3_key
    }
    puts message
    sqs = Aws::SQS::Queue.new(url: AWS_SQS_QUEUE_URL)
    sqs.send_message(message_body: message.to_json)

    scheduled_chapter_email.update(sent_at: Time.current)
    # assume for now that no books have only one chapter
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

  def only_one_active_for_user
    if user.active_subscription.present?
      errors.add(:base, 'You are already reading a book')
    end
  end

  def only_one_for_free_account_user
    if !user.has_full_access && user.subscriptions.any?
      errors.add(:base, 'You must become a member to read another book')
    end
  end
end
