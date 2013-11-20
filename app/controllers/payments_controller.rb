class PaymentsController < ApplicationController

  def new

  end

  def create
    binding.pry
    Stripe::Customer.create(
      :card => params[:token],
      :plan => "premium-monthly",
      :email => params[:email]
    )
  end
end