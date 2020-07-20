class CreateHouseupdates < ActiveRecord::Migration[6.0]
  def change
    create_table :houseupdates do |t|
      t.integer :poster
      t.integer :item
      t.integer :reader, default: nil
      t.datetime :read_at, default: nil

      t.timestamps
    end
  end
end
