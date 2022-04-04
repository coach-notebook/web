class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.string :name
      t.string :competition
      t.string :season

      t.timestamps
    end
  end
end
