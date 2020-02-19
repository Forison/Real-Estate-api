# frozen_string_literal: true

class House < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :pictures, presence: true
end
