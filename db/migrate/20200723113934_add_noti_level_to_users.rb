class AddNotiLevelToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :noti_level, :Integer
  end
end
