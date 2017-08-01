class StaticPagesController < ApplicationController
  skip_before_action :require_admin
  def home
    if logged_in?
      redirect_to user_path current_user
    end
  end

  def checkin
  end
end
