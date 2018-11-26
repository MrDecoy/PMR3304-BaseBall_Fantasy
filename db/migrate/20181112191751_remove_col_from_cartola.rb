class RemoveColFromCartola < ActiveRecord::Migration[5.0]
  def change
    remove_column :cartolas, :arremessador_id
    add_column :cartolas, :user_id, :integer

  end
end
