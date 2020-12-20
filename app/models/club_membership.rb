class ClubMembership < ApplicationRecord
  validates :club_id, uniqueness: { scope: :user_id }

  belongs_to :club
  belongs_to :user
end
