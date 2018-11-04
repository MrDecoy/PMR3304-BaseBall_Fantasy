class CreateRoundParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :round_participations do |t|
      t.integer :player_id
      t.integer :round_id
      t.string :team_id
      t.string :integer

      t.timestamps
    end
  end
end
