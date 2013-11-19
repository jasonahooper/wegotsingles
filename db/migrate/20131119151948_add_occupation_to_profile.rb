class AddOccupationToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :occupation, :string
  end
end
