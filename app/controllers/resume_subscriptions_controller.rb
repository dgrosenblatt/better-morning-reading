class ResumeSubscriptionsController < AuthenticatedController
  def update
    subscription = Subscription.find(params[:id])

    if subscription.update(status: Subscription::STATUSES[:active])
      msg = 'Subscription resumed.'
    else
      msg =
        "Subscription could not be resumed: #{subscription.errors.full_messages_for(:status)}."
    end

    redirect_to me_path, notice: msg
  end
end
