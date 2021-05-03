class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_stripe_params
  before_action :set_static_images

  protected

  def set_stripe_params
    if user_signed_in? && !current_user.has_full_access
      @stripe_price_id = STRIPE_PRICE_ID

      @stripe_customer_subscription = StripeCustomerSubscription.new(
        price_id: STRIPE_PRICE_ID,
        customer_id: current_user.stripe_customer_id
      )
    end
  end

  # Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_up_path_for(_resource)
    me_path
  end

  def after_sign_in_path_for(_resource)
    me_path
  end

  # Static from S3
  def set_static_images
    @cool_background_url = StaticImages.cool_background
    @sun_background_url = StaticImages.sun_background
    @ocean_background_url = StaticImages.ocean_background
    @kale_background_url = StaticImages.kale_background
    @gooey_background_url = StaticImages.gooey_background
    @gooey_background_small_url = StaticImages.gooey_background_small
    @fresh_background_url = StaticImages.fresh_background
  end
end
