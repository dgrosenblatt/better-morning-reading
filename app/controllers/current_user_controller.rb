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

    @history = current_user.history
  end

  def manage
    session = Stripe::BillingPortal::Session.create({
      customer: current_user.stripe_customer_id,
      return_url: me_url,
    })

    redirect_to session.url
  end
end
