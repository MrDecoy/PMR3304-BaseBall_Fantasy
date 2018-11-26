class CreateCartolasPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :cartolas_players do |t|
      t.integer :cartola_id, null: false
      t.integer :player_id, null: false

    end
    add_index :cartolas_players, [:cartola_id, :player_id],
              unique: true
  end
end
