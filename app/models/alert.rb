class Alert < ApplicationRecord
  validates :message, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :sender, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
end
