class AddFavouriteTippleToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :favourite_tipple, :string
  end
end
