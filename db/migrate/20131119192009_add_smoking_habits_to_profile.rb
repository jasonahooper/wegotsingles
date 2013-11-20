class AddSmokingHabitsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :smoking_habits, :string
  end
end
