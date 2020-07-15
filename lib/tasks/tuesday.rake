require_relative 'daily_email_sender'

desc 'Queue Tuesday subscription chapter emails in SQS'
task tuesday: [:environment] do
  puts 'Queueing Tuesday emails'

  DailyEmailSender.new('tuesday').perform
end
