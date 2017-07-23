class ChargesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def new
  end

  def create
    @amount = params[:amount]

    @amount = @amount.gsub('$', '').gsub(',', '')

    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
      redirect_to new_charge_path
      return
    end

    @amount = (@amount * 100).to_i # Must be an integer!

    if @amount < 2000
      flash[:error] = 'Charge not completed. Donation amount must be at least $20.'
      redirect_to new_charge_path
      return
    end

    charge = Stripe::Charge.create(
      :amount      => @amount,
      :description => current_user.email,
      :source => params[:stripeToken],
      :currency    => 'usd'
    )
    flash[:notice] = "Thanks you paid $ #{number_to_currency(@amount/100, :unit => "$")}."
    current_user.payments.create :amount => @amount, :charge_id => charge.id
    redirect_to user_path current_user

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to user_path current_user
  end

end
