class CreateStadia < ActiveRecord::Migration[5.0]
  def change
    create_table :stadia do |t|
      t.string :city
      t.string :university
      t.string :cep
      t.string :street
      t.string :number
      t.string :state

      t.timestamps
    end
  end
end
