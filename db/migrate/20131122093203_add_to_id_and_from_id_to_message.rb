class AddToIdAndFromIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :to_id, :integer
    add_column :messages, :from_id, :integer
  end
end
