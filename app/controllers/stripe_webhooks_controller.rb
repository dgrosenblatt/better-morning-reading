class StripeWebhooksController < ApplicationController
  protect_from_forgery except: :create

  def create
    payload = request.body.read
    event = nil

    begin
      event = Stripe::Event.construct_from(
        JSON.parse(payload, symbolize_names: true)
      )
    rescue JSON::ParserError => e
      # Invalid payload
      head 400 and return
    end

    # Handle the event
    case event.type
    when 'customer.subscription.deleted'
      # customer has canceled via portal
      subscription = event.data.object
      customer_id = subscription['customer']
      user = User.find_by(stripe_customer_id: customer_id)
      if user
        user.update(stripe_subscription_data: subscription)
      end
    when 'customer.subscription.updated'
      # user canceled / changed mind for end of billing period
      subscription = event.data.object
      customer_id = subscription['customer']
      user = User.find_by(stripe_customer_id: customer_id)
      if user
        user.update(stripe_subscription_data: subscription)
      end
    else
      # Unexpected event type
      head 400 and return
    end

    head 200
  end
end
