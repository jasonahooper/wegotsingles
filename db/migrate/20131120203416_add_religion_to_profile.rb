class AddReligionToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :religion, :string
    add_column :profiles, :religion_interest_level, :integer
  end
end
