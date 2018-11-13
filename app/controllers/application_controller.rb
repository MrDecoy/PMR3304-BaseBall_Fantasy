class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_url, alert: "Not Authorized" if current_user.nil?
  end

  def is_admin?
    redirect_to users_path, alert: "Not authorized" if current_user.nil? or !current_user.admin?
  end

  helper_method :current_user
end
