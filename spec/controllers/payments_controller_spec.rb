require 'spec_helper'

describe PaymentsController do

  it "should create a stripe customer on create" do
    @payment_option = PaymentOption.make
    Stripe::Plan.stubs(:create).with({
      :amount => @payment_option.amount,
      :interval => @payment_option.interval ,
      :name => @payment_option.name,
      :currency => @payment_option.currency,
      :id => @payment_option.code
    })
    @user = User.make!
    @payment_option.save!

    params = {
      :token => "token",
      :email => @user.email
    }
    Stripe::Customer.expects(:create).with(
      :card => "token",
      :plan => @payment_option.code,
      :email => @user.email
    )
    post :create, params    

  end
end
