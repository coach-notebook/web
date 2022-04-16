class AddDrillsPractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practice_drills, id: :uuid do |t|
      t.references :practice, null: false, foreign_key: true, type: :uuid
      t.references :drill, null: false, foreign_key: true, type: :uuid
      t.integer :position
      t.datetime :run_at
    end
  end
end
