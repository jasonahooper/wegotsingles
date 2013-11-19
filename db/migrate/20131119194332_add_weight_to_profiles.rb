class AddWeightToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :weight, :integer
  end
end
