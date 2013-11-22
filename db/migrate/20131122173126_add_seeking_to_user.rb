class AddSeekingToUser < ActiveRecord::Migration
  def change
    add_column :users, :seeking, :string
  end
end
