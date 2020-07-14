class CurrentUserController < AuthenticatedController
  def show
    @user = current_user
    @subscription = current_user.active_subscription
    @scheduled_chapter_emails =
      @subscription.scheduled_chapter_emails.includes(:chapter)
    @past_subscriptions =
      current_user.subscriptions.where(status: 'done').includes(:book)
    @stripe_price_id = STRIPE_PRICE_ID

    @stripe_customer_subscription = StripeCustomerSubscription.new(
      price_id: STRIPE_PRICE_ID,
      customer_id: current_user.stripe_customer_id
    )
  end
end
