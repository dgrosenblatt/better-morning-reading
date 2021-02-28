class DailyEmailSender
  def initialize(day)
    @day = day
  end

  def perform
    subscriptions = Subscription
      .where(@day => true, status: 'active')
      .includes(:user, :book, { scheduled_chapter_emails: :chapter })

    subscriptions.each do |subscription|
      scheduled_chapter_email = subscription
        .scheduled_chapter_emails.where(sent_at: nil)
        .order(position: :asc)
        .limit(1)
        .first
      chapter = scheduled_chapter_email.chapter

      message = {
        recipient: subscription.user.email,
        is_free_account: !subscription.user.has_full_access,
        book_name: subscription.book.name,
        chapter_name: chapter.name,
        chapter_s3_key: chapter.text_s3_key,
      }
      puts message
      sqs = Aws::SQS::Queue.new(url: AWS_SQS_QUEUE_URL)
      sqs.send_message(message_body: message.to_json)

      scheduled_chapter_email.update(sent_at: Time.current)

      if subscription.scheduled_chapter_emails.reload.pluck(:sent_at).all?(&:present?)
        subscription.update(status: 'done')
      end
    end

    clubs = Club
      .where(@day => true, status: 'active')
      .includes(:users, :book, { scheduled_club_emails: :chapter })

    clubs.each do |club|
      emails = club.users.pluck(:email)

      scheduled_club_email = club.
        scheduled_club_emails.
        where(sent_at: nil).
        order(position: :asc).
        limit(1).
        first

      chapter = scheduled_club_email.chapter

      message = {
        recipient: emails,
        is_free_account: false,
        book_name: club.book.name,
        chapter_name: chapter.name,
        chapter_s3_key: chapter.text_s3_key,
      }
      puts message
      sqs = Aws::SQS::Queue.new(url: AWS_SQS_QUEUE_URL)
      sqs.send_message(message_body: message.to_json)

      scheduled_club_email.update(sent_at: Time.current)

      if club.scheduled_club_emails.reload.pluck(:sent_at).all?(&:present?)
        club.update(status: 'done')
      end
    end
  end
end
