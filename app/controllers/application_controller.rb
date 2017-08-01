class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :move_to_signin, except: :new
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in?
  end
end

