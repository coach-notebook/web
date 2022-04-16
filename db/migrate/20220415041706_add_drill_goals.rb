class AddDrillGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :drills, :goals, :string, array: []
  end
end
