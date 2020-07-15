require_relative 'daily_email_sender'

desc 'Queue Thursday subscription chapter emails in SQS'
task thursday: [:environment] do
  puts 'Queueing Thursday emails'

  DailyEmailSender.new('thursday').perform
end
