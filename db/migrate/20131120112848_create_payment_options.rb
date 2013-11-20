class CreatePaymentOptions < ActiveRecord::Migration
  def change
    create_table :payment_options do |t|
      t.integer :amount
      t.string :interval
      t.string :name
      t.string :currency
      t.string :code

      t.timestamps
    end
  end
end
