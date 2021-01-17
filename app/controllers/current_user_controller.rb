class CurrentUserController < AuthenticatedController
  def show
    @user = current_user
    @scheduled_chapter_emails = []

    @subscription = current_user.active_subscription
    if @subscription.present?
      @scheduled_chapter_emails =
        @subscription.scheduled_chapter_emails.includes(:chapter).order(position: :asc)
    end

    @club = current_user.active_club || current_user.enrolling_club
    if @club.present?
      @scheduled_chapter_emails =
        @club.scheduled_club_emails.includes(:chapter).order(position: :asc)
    end

    @past_subscriptions =
      current_user.subscriptions.where(status: 'done').includes(:book)
    @past_clubs =
      current_user.clubs.where(status: 'done').includes(:book)
  end

  def manage
    session = Stripe::BillingPortal::Session.create({
      customer: current_user.stripe_customer_id,
      return_url: me_url,
    })

    redirect_to session.url
  end
end
