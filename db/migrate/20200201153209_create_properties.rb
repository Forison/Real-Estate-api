class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :price
      t.string :location

      t.timestamps
    end
  end
end
