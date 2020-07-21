class House < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :pictures, presence: true

  # after_create_commit { house_notification(self.id) }
  after_create_commit { NotificationBroadcastJob(self.id) } 

  # def house_notification(house_id)
  #   houses = House.find_by_id(house_id)
  #   return unless houses.present?
  #   Houseupdate.create!(poster: houses.user_id, item: house_id, reader: nil, status: nil)
  # end
end
