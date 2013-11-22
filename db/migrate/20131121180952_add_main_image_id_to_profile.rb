class AddMainImageIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :main_image_id, :integer
  end
end
