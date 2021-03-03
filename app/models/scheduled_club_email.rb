class ScheduledClubEmail < ApplicationRecord
  validates :position, presence: true

  belongs_to :chapter
  belongs_to :club

  def sent?
    !!sent_at
  end
end
