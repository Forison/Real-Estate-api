# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :country
      t.string :email
      t.string :picture
      t.string :password_digest

      t.timestamps
    end
  end
end
