require_relative 'daily_email_sender'

desc 'Queue Sunday subscription chapter emails in SQS'
task sunday: [:environment] do
  puts 'Queueing Sunday emails'

  DailyEmailSender.new('sunday').perform
end
