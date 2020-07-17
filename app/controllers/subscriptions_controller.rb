class SubscriptionsController < AuthenticatedController
  def new
    @book = Book.find(params[:book_id])
    @subscription = Subscription.new(book_id: params[:book_id])
  end

  def create
    @subscription = Subscription.new(create_subscription_params)

    if @subscription.save
      if params[:now] == '1'
        @subscription.quick_start!
      end

      redirect_to me_path, notice: 'Subscription created.'
    else
      @book = Book.find(params[:book_id])
      render :new
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @subscription = Subscription.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @subscription = Subscription.find(params[:id])

    if @subscription.update(update_subscription_params)
      redirect_to me_path, notice: 'Weekly schedule updated.'
    else
      render :edit
    end
  end

  def create_subscription_params
    params
      .require(:subscription)
      .permit(:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
      .merge(book_id: params[:book_id], user_id: current_user.id, status: 'active')
  end

  def update_subscription_params
    params
      .require(:subscription)
      .permit(:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
  end
end
