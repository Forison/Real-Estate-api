class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifyable, polymorphic: true
  validates_uniqueness_of :notifyable_type, scope: :notifyable_id, if: Proc.new{ |atts| atts.notifyable_id.present? }

  after_create_commit { BroadcastNotificationJob.perform_later(self.id) }
end
