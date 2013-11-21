class PaymentsController < ApplicationController

  def new
    if current_user.stripe_customer_id
      flash[:notice] = 'You already have an active subscription.'
      redirect_to root_path
    end
  end

  def create
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

  def destroy
    cu = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    cu.cancel_subscription
    current_user.stripe_customer_id = nil
    current_user.save!
    flash[:notice] = ('Subscription cancelled.')
    redirect_to edit_user_registration_path
  end
end