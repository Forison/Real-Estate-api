# frozen_string_literal: true

class Alert < ApplicationRecord
  validates :sender, presence: true
  validates :message, presence: true
end
