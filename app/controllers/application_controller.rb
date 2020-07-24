class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  !!current_user
  end

  def require_user
  if !logged_in?
    flash[:danger] = 'You must be logged in to perform that action!'
    redirect_to root_path
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :user_type])
  end
end
