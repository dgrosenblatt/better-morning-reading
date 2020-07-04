class StripeCustomerSubscriptionsController < AuthenticatedController
  def create
    begin
      Stripe::PaymentMethod.attach(
        stripe_params[:payment_method_id],
        { customer: stripe_params[:customer_id] }
      )
    rescue Stripe::CardError => e
      # redirect and flash
      halt 200, { 'Content-Type' => 'application/json' }, { 'error': { message: e.error.message } }.to_json
    end

    # Set the default payment method on the customer
    Stripe::Customer.update(
      stripe_params[:customer_id],
      invoice_settings: {
        default_payment_method: stripe_params[:payment_method_id]
      }
    )

    # Create the subscription
    subscription = Stripe::Subscription.create(
      customer: stripe_params[:customer_id],
      items: [{ price: stripe_params[:price_id] }],
      expand: ['latest_invoice.payment_intent', 'items.data.price']
    )

    StripeCustomerSubscription.create(
      user: current_user,
      subscription_id: subscription.id,
      customer_id: subscription.customer,
      payment_method_id: stripe_params[:payment_method_id],
      price_id: subscription.items.data[0].price.id,
      status: subscription.status,
      current_period_end: subscription.current_period_end
    )

    redirect_to me_path, notice: 'Account successfully upgraded to full access.'
  end

  private

  def stripe_params
    params
      .require(:stripe_customer_subscription)
      .permit(:customer_id, :payment_method_id, :price_id)
  end
end
