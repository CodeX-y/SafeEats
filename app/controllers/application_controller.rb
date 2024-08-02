class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_forgery_protection

  def after_sign_up_path_for(resource)
    edit_homepage_path(current_user)
  end

  def after_sign_in_path_for(resource)
    edit_homepage_path(current_user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username,])
    devise_parameter_sanitizer.permit(:account_update, :keys => [:username])
  end
end
