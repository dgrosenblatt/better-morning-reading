class ScheduledChapterEmail < ApplicationRecord
  belongs_to :chapter
  belongs_to :subscription

  def sent?
    !!sent_at
  end
end
