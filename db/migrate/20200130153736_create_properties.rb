class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :category
      t.string :price
      t.integer :size

      t.timestamps
    end
  end
end
