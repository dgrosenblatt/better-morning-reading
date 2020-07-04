class StripeCustomerSubscription < ApplicationRecord
  ACTIVE_STATUS = 'active'

  after_commit :update_user, on: [:create, :update]

  belongs_to :user

  def update_user
    if status == ACTIVE_STATUS
      user.update!(has_full_access: true)
    else
      user.update!(has_full_access: false)
    end
  end
end
