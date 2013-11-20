class AddStarSignsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :star_sign, :string
    add_column :profiles, :star_sign_interest_level, :integer
  end
end
