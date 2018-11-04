class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :home_id
      t.integer :visitor_id
      t.integer :stadium_id
      t.integer :round_id
      t.integer :home_score
      t.integer :visiting_score

      t.timestamps
    end
  end
end
