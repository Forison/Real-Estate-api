# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :myfavorite
      t.timestamps
    end
  end
end
