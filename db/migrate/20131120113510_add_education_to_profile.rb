class AddEducationToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :education, :integer
  end
end
