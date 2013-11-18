class CreateProfileEthnicities < ActiveRecord::Migration
  def change
    create_table :profile_ethnicities do |t|
      t.integer :profile_id
      t.string :ethnicity

      t.timestamps
    end
  end
end
