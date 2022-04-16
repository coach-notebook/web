class AddDrillVariations < ActiveRecord::Migration[7.0]
  def change
    add_column :drills, :variations, :string, array: true, default: []
    add_column :practice_drills, :variation, :string
  end
end
