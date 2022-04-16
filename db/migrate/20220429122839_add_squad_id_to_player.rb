class AddSquadIdToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :squad_id, :uuid
  end
end
