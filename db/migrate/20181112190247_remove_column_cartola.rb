class RemoveColumnCartola < ActiveRecord::Migration[5.0]
  def change
    remove_column :cartolas, :player_1_id
    remove_column :cartolas, :player_2_id
    remove_column :cartolas, :player_3_id
    remove_column :cartolas, :player_4_id
    remove_column :cartolas, :player_5_id
    remove_column :cartolas, :player_6_id
    remove_column :cartolas, :player_7_id
    remove_column :cartolas, :player_8_id

  end
end
