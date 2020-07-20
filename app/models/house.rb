class House < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :pictures, presence: true

  after_create_commit { NotificationBroadcastJob.perform_later(self.id) } 
end
