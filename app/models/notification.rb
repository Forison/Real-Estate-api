class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifyable, polymorphic: true
end
