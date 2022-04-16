class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :name
      t.references :squad, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
