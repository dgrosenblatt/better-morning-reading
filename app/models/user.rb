class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :confirmable, :recoverable

  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: true

  has_many :subscriptions
  has_one :active_subscription
  has_one :stripe_customer_subscription
  has_many :club_memberships
  has_many :clubs, through: :club_memberships
  has_one :active_club
  has_many :user_favorite_books
  has_many :favorite_books, through: :user_favorite_books, source: :book

  def active_subscription
    subscriptions.find_by(status: ['active', 'paused'])
  end

  def active_club
# make sure index on club#status and subscription#status
    clubs.find_by(status: 'active')
  end

  def enrolling_club
    clubs.find_by(status: 'enrolling')
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
    return false if has_full_access
    # Free account and all subscriptions are done
    (
      subscriptions.length > 0 &&
      subscriptions.pluck(:status).uniq == [Subscription::STATUSES[:done]]
    ) ||
    (
      clubs.length > 0 &&
      clubs.pluck(:status).uniq == [Club::STATUSES[:done]]
    )
  end

  def history # => [{ name:, date: }]
    past_subscriptions = subscriptions.where(status: 'done').includes(:book)
    past_clubs = clubs.where(status: 'done').includes(:book)
    all_books = past_subscriptions.to_a.concat(past_clubs.to_a)

    all_books.map do |sub_or_club|
        {
          name: sub_or_club.book.name,
          date: sub_or_club.updated_at.strftime("%m/%d/%Y")
        }
    end.sort { |a, b| b[:date] <=> a[:date] }
  end
end
