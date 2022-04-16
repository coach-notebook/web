class ChangeMatchAttributes < ActiveRecord::Migration[7.0]
  def change
    remove_column :matches, :result
    add_column :matches, :home_score, :integer, default: 0
    add_column :matches, :away_score, :integer, default: 0

    add_column :appearances, :starting_position, :integer
  end
end
