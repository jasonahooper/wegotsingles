class AddProgressToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :progress, :float
  end
end
