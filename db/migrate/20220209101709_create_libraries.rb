class CreateLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :libraries, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :notes
      t.timestamps
    end
  end
end
