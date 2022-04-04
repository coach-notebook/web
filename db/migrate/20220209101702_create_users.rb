class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email_address
      t.string :name
      t.timestamps
    end
  end
end
