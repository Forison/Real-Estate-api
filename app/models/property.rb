class Property < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy

  validates :name, presence:true
  validates :category, presence:true
  validates :description, presence:true
  validates :price, presence:true
  validates :location, presence:true
  # validates :images, presence:true
end
