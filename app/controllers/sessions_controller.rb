class SessionsController < ApplicationController
  skip_before_action :require_admin, :only => [:new, :create, :destroy]
  before_action :redirect_if_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def redirect_if_logged_in
    if current_user
      redirect_to current_user
    end
  end
end
