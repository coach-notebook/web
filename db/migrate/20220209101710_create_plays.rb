class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays, id: :uuid do |t|
      t.references :library, foreign_key: true, type: :uuid
      t.string :name
      t.text :notes
      t.integer :court, default: 0
      t.jsonb :phases, default: []
      t.timestamps
    end
  end
end
