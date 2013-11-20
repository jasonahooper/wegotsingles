class AddDrinkFrequencyToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :drink_frequency, :string
  end
end
