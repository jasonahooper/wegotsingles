require 'spec_helper'

describe PaymentsController do
  context "logged in user" do

    before do
      @user = User.make!
      sign_in @user
    end

    describe "creating a stripe customer on create" do
      before do
        Stripe::Plan.stubs(:create)
        @payment_option = PaymentOption.make!
        # Stripe::Plan.stubs(:create).with({
        #   :amount => @payment_option.amount,
        #   :interval => @payment_option.interval ,
        #   :name => @payment_option.name,
        #   :currency => @payment_option.currency,
        #   :id => @payment_option.code
        # })
        # @payment_option.save!

        params = {
          :stripeToken => "token",
          :email => @user.email
        }

        customer_json = JSON(File.read('spec/fixtures/customer.json'))
        Stripe::Customer.expects(:create).with(
          :card => "token",
          :plan => PaymentOption.premium_monthly.code,
          :email => @user.email
        ).returns(customer_json)

        post :create, params
      end

      it "should set the customer stripe id" do
        @user.reload.stripe_customer_id.should eq("cus_2yc1BvwsPNa1Dn")
      end
    end

    describe 'cancelling a customer account' do
      before do
        @user.stripe_customer_id = 'cus_2yc1BvwsPNa1Dn'
        @user.save!

        mock_customer = mock
        mock_customer.stubs(:cancel_subscription)
        Stripe::Customer.expects(:retrieve).with('cus_2yc1BvwsPNa1Dn').
          returns(mock_customer)

        delete :destroy
      end

      it 'should reset the customer_stripe_id' do
        @user.reload
        @user.stripe_customer_id.should be_nil
      end
    end
  end
end