class StripeCustomerSubscriptionsController < AuthenticatedController
  def create
    begin
      Stripe::PaymentMethod.attach(
        stripe_params[:payment_method_id],
        { customer: stripe_params[:customer_id] }
      )
    rescue Stripe::CardError => e
      redirect_to me_path, alert: "Error: #{e.error.message} Please try again." and return
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

    current_user.update(stripe_subscription_data: subscription)

    redirect_to me_path, notice: 'Account successfully upgraded to full membership.'
  end

  private

  def stripe_params
    params
      .require(:stripe_customer_subscription)
      .permit(:customer_id, :payment_method_id, :price_id)
  end
end
