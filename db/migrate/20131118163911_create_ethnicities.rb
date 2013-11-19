class CreateEthnicities < ActiveRecord::Migration
  def change
    create_table :ethnicities do |t|
      t.string :ethnicity

      t.timestamps
    end
  end
end
