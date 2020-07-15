require_relative 'daily_email_sender'

desc 'Queue Wednesday subscription chapter emails in SQS'
task wednesday: [:environment] do
  puts 'Queueing Wednesday emails'

  DailyEmailSender.new('wednesday').perform
end
