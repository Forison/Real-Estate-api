class User < ApplicationRecord
  has_many :houses
  has_one_attached :avatar, dependent: :destroy
  # validates_attachment_presence :avatar
  acts_as_token_authenticatable
  before_save { self.email = email.downcase }
  validates :username, presence:true, length:{maximum:20}
  validates :country, presence:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 5 }
    validates :password_confirmation , presence:true, length: { minimum:5 }
end
