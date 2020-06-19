class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :house
  validate :user_id, presence: true
  validate :house_id, presence: true
end
