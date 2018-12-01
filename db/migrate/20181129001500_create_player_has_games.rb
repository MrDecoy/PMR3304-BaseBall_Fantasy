class CreatePlayerHasGames < ActiveRecord::Migration[5.0]
  def change
    create_table :player_has_games do |t|

      t.timestamps
    end
  end
end
