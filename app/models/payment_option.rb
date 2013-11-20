class PaymentOption < ActiveRecord::Base
  after_create do 
    Stripe::Plan.create(
      :amount => self.amount,
      :interval => self.interval,
      :name => self.name,
      :currency => self.currency,
      :id => self.code
    )
  end

  def self.premium_monthly
    self.find_by_code('premium-monthly')
  end
end
