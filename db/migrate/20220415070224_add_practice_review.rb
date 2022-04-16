class AddPracticeReview < ActiveRecord::Migration[7.0]
  def change
    add_column :practices, :review, :string
  end
end
