class PaymentsController < ApplicationController

  def new

  end

  def create
    binding.pry
    @customer_json  = Stripe::Customer.create(
      :card => params['stripeToken'],
      :plan => "premium-monthly",
      :email => current_user.email
    )
    @user = current_user
    @user.retrieve_id(@customer_json)
    @user.save!
    if @user.stripe_customer_id
      redirect_to payments_welcome_path
    end
  end
end