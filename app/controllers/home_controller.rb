class HomeController < ApplicationController
  def show
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
end
