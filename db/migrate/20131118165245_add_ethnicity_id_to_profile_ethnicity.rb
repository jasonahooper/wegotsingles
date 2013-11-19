class AddEthnicityIdToProfileEthnicity < ActiveRecord::Migration
  def change
    add_column :profile_ethnicities, :ethnicity_id, :integer
  end
end
