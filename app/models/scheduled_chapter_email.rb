class ScheduledChapterEmail < ApplicationRecord
  belongs_to :chapter
  belongs_to :subscription
end
