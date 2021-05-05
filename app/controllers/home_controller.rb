class HomeController < ApplicationController
  before_action :send_data_to_segment, only: :show

  def show
    @books = Book.sample

    if user_signed_in?
      redirect_to me_path
    end
  end

  def about
  end

  def terms
  end

  def privacy
  end

  private

  def send_data_to_segment
    if RAILS_ENV != 'development'
      Analytics.track(
        user_id: 'guest',
        event: "Home page visit at #{APPLICATION_HOST}",
        properties: {
          referrer: request.referrer,
        }
      )
    else
      puts 'Home page visit'
      puts request.referrer
    end
  end
end
