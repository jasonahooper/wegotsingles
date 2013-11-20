class AddBiographyToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :about_you, :text
    add_column :profiles, :likes_and_dislikes, :text
    add_column :profiles, :looking_for, :text
  end
end
