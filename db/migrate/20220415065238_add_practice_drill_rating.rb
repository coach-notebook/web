class AddPracticeDrillRating < ActiveRecord::Migration[7.0]
  def change
    add_column :practice_drills, :rating, :integer, default: 0
  end
end
