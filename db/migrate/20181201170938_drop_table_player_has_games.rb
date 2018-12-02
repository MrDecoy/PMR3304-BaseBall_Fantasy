class DropTablePlayerHasGames < ActiveRecord::Migration[5.0]
  def change
    drop_table :PlayerHasGames
  end
end
