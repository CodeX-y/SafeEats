class ApplicationController < ActionController::Base
  include Pundit
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_forgery_protection
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_up_path_for(resource)
    select_diet_path
  end

  def after_sign_in_path_for(resource)
    select_diet_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username,])
    devise_parameter_sanitizer.permit(:account_update, :keys => [:username])
  end

  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      
      redirect_back fallback_location: root_url
    end
end
