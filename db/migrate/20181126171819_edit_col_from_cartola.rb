class EditColFromCartola < ActiveRecord::Migration[5.0]
  def change
    remove_column :cartolas, :user_id
    add_column :cartolas, :player_id, :integer

  end
end
