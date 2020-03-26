# frozen_string_literal: true

class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.string :description
      t.string :price
      t.string :location
      t.string :pictures, array: true, default: []

      t.timestamps
    end
  end
end
