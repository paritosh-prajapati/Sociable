class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :profile_image)}
    devise_parameter_sanitizer.permit(:account_update, keys: %i[profile_image name username])
  end

  def after_sign_in_path_for(users)
    posts_path
  end
  
end
