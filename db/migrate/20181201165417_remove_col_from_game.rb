class RemoveColFromGame < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :home_id
    remove_column :games, :visitor_id
    remove_column :games, :round_id
  end
end
