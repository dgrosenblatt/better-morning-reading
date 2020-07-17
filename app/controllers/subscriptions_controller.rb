class SubscriptionsController < AuthenticatedController
  def new
    @book = Book.find(params[:book_id])
    @subscription = Subscription.new(book_id: params[:book_id])
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      if params[:now] == '1'
        @subscription.quick_start!
      end

      redirect_to me_path, notice: 'Subscription created'
    else
      @book = Book.find(params[:book_id])
      render :new
    end
  end

  def subscription_params
    params
      .require(:subscription)
      .permit(:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
      .merge(book_id: params[:book_id], user_id: current_user.id, status: 'active')
  end
end
