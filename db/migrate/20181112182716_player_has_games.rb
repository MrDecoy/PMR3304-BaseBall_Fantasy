class PlayerHasGames < ActiveRecord::Migration[5.0]
  def change
    create_table :PlayerHasGames do |t|
      t.integer :game_id, null:false
      t.integer :player_id, null:false
      t.integer :team_id
      t.integer :score
      t.integer :homerun
      t.integer :hits
      t.integer :at_bats
      t.integer :rbi
      t.integer :runs
      t.integer :error
    end
    add_index :PlayerHasGames, [:game_id, :player_id, :team_id, :score, :homerun, :hits, :at_bats, :rbi, :runs, :error], unique: true
  end
end
