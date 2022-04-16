class FinaliseMatch < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :score_final, :boolean, default: false
    add_column :matches, :forfeit, :boolean, default: false
  end
end
