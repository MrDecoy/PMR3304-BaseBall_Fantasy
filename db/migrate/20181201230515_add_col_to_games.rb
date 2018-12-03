class AddColToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :home_team, :integer
    add_column :games, :visiting_team, :integer

  end
end
