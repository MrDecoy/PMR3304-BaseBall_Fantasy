class CreateCartolas < ActiveRecord::Migration[5.0]
  def change
    create_table :cartolas do |t|
      t.string :nome
      t.string :arremessador_id
      t.integer :player_1_id
      t.integer :player_2_id
      t.integer :player_3_id
      t.integer :player_4_id
      t.integer :player_5_id
      t.integer :player_6_id
      t.integer :player_7_id
      t.integer :player_8_id

      t.timestamps
    end
  end
end
