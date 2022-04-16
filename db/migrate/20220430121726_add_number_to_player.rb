class AddNumberToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :number, :string
  end
end
