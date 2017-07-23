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
    end
  end
end
