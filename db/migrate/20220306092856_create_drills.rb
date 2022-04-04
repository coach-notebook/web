class CreateDrills < ActiveRecord::Migration[6.0]
  def change
    create_table :drills, id: :uuid do |t|
      t.references :library, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
