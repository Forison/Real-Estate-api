# frozen_string_literal: true

class User < ApplicationRecord
  has_many :houses, dependent: :destroy
  acts_as_token_authenticatable
  before_save { self.email = email.downcase }
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
