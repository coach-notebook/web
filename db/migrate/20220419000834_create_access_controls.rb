class CreateAccessControls < ActiveRecord::Migration[7.0]
  def change
    create_table :access_controls, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :access_controlled, polymorphic: true, null: false, type: :uuid
      t.datetime :suspended_at
      t.timestamps
    end
  end
end
