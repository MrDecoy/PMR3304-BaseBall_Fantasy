class AddColToPlayerHasGames < ActiveRecord::Migration[5.0]
  def change
    add_column :player_has_games, :game_id, :integer
    add_column :player_has_games, :player_id, :integer
    add_column :player_has_games, :team_id, :integer
    add_column :player_has_games, :score, :integer
    add_column :player_has_games, :home_run, :integer
    add_column :player_has_games, :hits, :integer
    add_column :player_has_games, :at_bats, :integer
    add_column :player_has_games, :rbi, :integer
    add_column :player_has_games, :runs, :integer
    add_column :player_has_games, :errors, :integer
    add_index :player_has_games, [:game_id, :player_id], unique: true, :name => 'game_player_index'

  end
end
