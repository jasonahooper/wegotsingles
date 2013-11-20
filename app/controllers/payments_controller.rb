class PaymentsController < ApplicationController

  def new

  end

  def create
    @customer_json  = Stripe::Customer.create(
      :card => params[:token],
      :plan => "premium-monthly",
      :email => params[:email]
    )
    @user = current_user
    @user.retrieve_id(@customer_json)
    @user.save!
    if @user.stripe_customer_id
      redirect_to payments_welcome_path
    end
  end
end