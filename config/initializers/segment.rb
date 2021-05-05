require 'segment/analytics'

SEGMENT_WRITE_KEY = ENV.fetch('SEGMENT_WRITE_KEY')
APPLICATION_HOST = ENV.fetch('APPLICATION_HOST')
RAILS_ENV = ENV.fetch('RAILS_ENV')

Analytics = Segment::Analytics.new({
    write_key: SEGMENT_WRITE_KEY,
    on_error: Proc.new { |status, msg| print msg }
})
