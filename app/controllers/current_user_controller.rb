class CurrentUserController < AuthenticatedController
  def show
    @user = current_user
    @subscription = current_user.active_subscription
    if @subscription.present?
      @scheduled_chapter_emails =
        @subscription.scheduled_chapter_emails.includes(:chapter).order(position: :asc)
    else
      @scheduled_chapter_emails = []
    end
    @past_subscriptions =
      current_user.subscriptions.where(status: 'done').includes(:book)
  end
end
