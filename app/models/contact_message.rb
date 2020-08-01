class ContactMessage < ApplicationRecord
  validates :reply_email,
    presence: true,
    format: { with: /@/, message: 'must be an email address' }
  validates :message, presence: true
end
