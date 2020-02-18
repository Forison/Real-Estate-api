class AddAttachmentImagesToHouses < ActiveRecord::Migration[6.0]
  def self.up
    change_table :houses do |t|
      t.attachment :images
    end
  end

  def self.down
    remove_attachment :houses, :images
  end
end
