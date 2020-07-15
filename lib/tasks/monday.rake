require_relative 'daily_email_sender'

desc 'Queue Monday subscription chapter emails in SQS'
task monday: [:environment] do
  puts 'Queueing Monday emails'

  DailyEmailSender.new('monday').perform
end
