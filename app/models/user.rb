class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :houses, dependent: :destroy
  acts_as_token_authenticatable
  before_save { self.email = email.downcase }
  before_save { self.noti_level = Houseupdate.pluck('id').max == nil ? 0 : Houseupdate.pluck('id').max }
  validates :username, presence: true, length: { maximum: 20 }
  validates :country, presence: true
  validates :picture, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }
end
