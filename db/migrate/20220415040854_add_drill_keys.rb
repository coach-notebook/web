class AddDrillKeys < ActiveRecord::Migration[7.0]
  def change
    add_column :drills, :keys, :string, array: true
  end
end
