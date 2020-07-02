class Book < ApplicationRecord
  validates :author, presence: true
  validates :coverImageThumbS3Key, presence: true
  validates :coverImageFullS3Key, presence: true
  validates :name, presence: true
end
