class AddColumnToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :game_date, :datetime
  end
end
