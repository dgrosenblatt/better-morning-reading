desc 'Queue Monday subscription chapter emails in SQS'
task monday: [:environment] do
  puts 'Queueing Monday emails'

  # Find active subscriptions
    # user: email
    # book: name
    # chapter where highest position and sent is false: body, title

  # Send to SQS
  sqs = Aws::SQS::Queue.new(url: AWS_SQS_QUEUE_URL)

  message = {
    recipient: 'dgrosenblatt@gmail.com',
    book_name: 'Pride and Prejudice',
    chapter_name: 'Chapter 1',
    chapter_s3_key: 'pride-and-prejudice/chapters/chapter1.html'
  }
  sqs.send_message(message_body: message.to_json)
end
