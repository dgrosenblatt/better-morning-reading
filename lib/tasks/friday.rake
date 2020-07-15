require_relative 'daily_email_sender'

desc 'Queue Friday subscription chapter emails in SQS'
task friday: [:environment] do
  puts 'Queueing Friday emails'

  DailyEmailSender.new('friday').perform
end
