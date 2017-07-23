class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_log_in

  def home
  end

  def require_log_in
    if !logged_in?
      redirect_to login_path
      return false
    else
      return true
    end
  end

  def is_admin_user
    current_user.isadmin?
  end

  def require_admin
    if require_log_in
      if is_admin_user
        return true
      else
        redirect_to user_path current_user
      end
    end
  end

end
