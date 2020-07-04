class CurrentUserController < AuthenticatedController
  def show
    @user = current_user
    @stripe_price_id = STRIPE_PRICE_ID

    @stripe_customer_subscription = StripeCustomerSubscription.new(
      price_id: STRIPE_PRICE_ID,
      customer_id: current_user.stripe_customer_id
    )
  end
end
