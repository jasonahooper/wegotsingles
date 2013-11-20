require 'spec_helper'

describe PaymentOption do
  it "should create a paymeny on stripe on create" do
    @payment_option = PaymentOption.make
    Stripe::Plan.expects(:create).with({
      :amount => @payment_option.amount,
      :interval => @payment_option.interval ,
      :name => @payment_option.name,
      :currency => @payment_option.currency,
      :id => @payment_option.code
    })
    @payment_option.save!
  end
end
