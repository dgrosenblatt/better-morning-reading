class CurrentUserController < AuthenticatedController
  def show
    @user = current_user
  end
end
