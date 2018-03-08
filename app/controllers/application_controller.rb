class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :username, :image_url, :uid, :token, :admin, :staff, :active, :provider, :description, :owner, :broadcaster_type)
    end
  end
end
