class CreateAppearances < ActiveRecord::Migration[7.0]
  def change
    create_table :appearances, id: :uuid do |t|
      t.references :match, null: false, foreign_key: true, type: :uuid
      t.references :player, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
