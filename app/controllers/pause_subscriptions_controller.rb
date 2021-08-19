class PauseSubscriptionsController < AuthenticatedController
  def update
    subscription = Subscription.find(params[:id])

    if subscription.update(status: Subscription::STATUSES[:paused])
      msg = 'Subscription paused.'
    else
      msg =
        "Subscription could not be paused: #{subscription.errors.full_messages_for(:status)}."
    end

    redirect_to me_path, notice: msg
  end
end
