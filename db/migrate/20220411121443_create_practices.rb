class CreatePractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practices, id: :uuid do |t|
      t.datetime :practice_at
      t.references :squad, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
