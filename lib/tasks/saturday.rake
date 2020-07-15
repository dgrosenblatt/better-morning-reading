require_relative 'daily_email_sender'

desc 'Queue Saturday subscription chapter emails in SQS'
task saturday: [:environment] do
  puts 'Queueing Saturday emails'

  DailyEmailSender.new('saturday').perform
end
