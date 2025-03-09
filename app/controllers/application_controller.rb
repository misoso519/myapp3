class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :bio, :profile_image])
  end
end
