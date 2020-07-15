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
        book_name: subscription.book.name,
        chapter_name: chapter.name,
        chapter_s3_key: chapter.text_s3_key
      }
      puts message
      sqs = Aws::SQS::Queue.new(url: AWS_SQS_QUEUE_URL)
      sqs.send_message(message_body: message.to_json)

      scheduled_chapter_email.update(sent_at: Time.current)

      if subscription.scheduled_chapter_emails.reload.pluck(:sent_at).all?(&:present?)
        subscription.update(status: 'done')
      end
    end
  end
end
