class AddIndexToTable < ActiveRecord::Migration[5.0]
  def change
    add_index :cartola_players, [:cartola_id, :player_id], unique: true
  end
end
