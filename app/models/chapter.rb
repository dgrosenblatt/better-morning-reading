class Chapter < ApplicationRecord
  validates :position, presence: true
  validates :name, presence: true
  validates :text_s3_key, presence: true

  belongs_to :book
end
