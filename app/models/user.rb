class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable#, :confirmable, :recoverable

  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: true

  has_many :subscriptions
  has_one :active_subscription
  has_one :stripe_customer_subscription

  def active_subscription
    subscriptions.find_by(status: 'active')
  end

  # helpers
  def membership_type
    if has_full_access
      'Full Access'
    else
      'Free Account'
    end
  end

  def has_full_access
    if stripe_subscription_data
      stripe_subscription_data['status'] == 'active' && stripe_subscription_data['current_period_end'] > Time.now.to_i
    else
      false
    end
  end

  def exhausted_free_account?
    # Free account and all subscriptions are done
    !has_full_access &&
      subscriptions.length > 0 &&
      subscriptions.pluck(:status).uniq == [Subscription::STATUSES[:done]]
  end
end
