class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notifyable, polymorphic: true, null: false
      t.boolean :read

      t.timestamps
    end
  end
end
