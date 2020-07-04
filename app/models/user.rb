class User < ApplicationRecord
  devise :database_authenticatable, :registerable #, :confirmable, :recoverable

  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /@/, message: 'must be a valid email' }

  has_one :stripe_customer_subscription

  def membership_type
    if has_full_access
      'Full Access'
    else
      'Free Account'
    end
  end
end
