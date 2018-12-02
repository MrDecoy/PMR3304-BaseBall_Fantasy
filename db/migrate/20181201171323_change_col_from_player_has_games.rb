class ChangeColFromPlayerHasGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :player_has_games, :errors
    add_column :player_has_games, :misses, :integer

  end
end
