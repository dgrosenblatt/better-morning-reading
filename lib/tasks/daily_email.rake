require_relative 'daily_email_sender'

desc 'Queue daily subscription chapter emails in SQS'
task daily_email: [:environment] do
  day = Time.current.strftime('%A').downcase
  puts "Queueing emails for #{day}"

  DailyEmailSender.new(day).perform
end
