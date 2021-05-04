class OnDemandSendSubscriptionsController < FullAccessController
  def update
    subscription = Subscription.find(params[:id])
    subscription.send_on_demand!

    redirect_to me_path, notice: 'Chapter sent!'
  end
end
