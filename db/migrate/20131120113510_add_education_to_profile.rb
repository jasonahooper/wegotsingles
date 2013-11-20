class AddEducationToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :education, :string
  end
end
