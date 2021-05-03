class FullAccessController < AuthenticatedController
  # Inherit from here to permit only full access users
  before_action :require_full_access!

  def require_full_access!
    if !current_user.has_full_access
      redirect_to me_path, alert: 'Please upgrade to full membership to access this feature.'
    end
  end
end
