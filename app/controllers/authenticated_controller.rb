class AuthenticatedController < ApplicationController
  # Inherit from here to require user to be signed in
  before_action :authenticate_user!
end
