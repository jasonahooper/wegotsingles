class DropEthnicityFromProfileEthnicity < ActiveRecord::Migration
  def change
    remove_column :profile_ethnicities, :ethnicity
  end
end
