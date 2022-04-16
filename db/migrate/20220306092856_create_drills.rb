class CreateDrills < ActiveRecord::Migration[6.0]
  def change
    create_table :drills, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :library, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :body
      t.integer :duration_minutes
      t.string :tags, array: true, default: []
      t.string :number_of_players
      t.timestamps
    end
  end
end
