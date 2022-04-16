class ChangePlayerSquadToTeam < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :squad_id, :uuid
    add_column :players, :team_id, :uuid
    # add_foreign_key :players, :team_id
  end
end
