class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches, id: :uuid do |t|
      t.datetime :played_at
      t.string :opposition
      t.string :result
      t.boolean :home_team
      t.references :team, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
