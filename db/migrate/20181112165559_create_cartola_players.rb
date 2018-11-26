class CreateCartolaPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :cartola_players do |t|
      t.integer :player_id
      t.integer :cartola_id

      t.timestamps
    end
  end
end
