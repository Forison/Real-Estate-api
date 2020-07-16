class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(house_id)
    houses = House.find_by_id(house_id)
    return unless houses.present?
    ActionCable.server.broadcast('houses_channel', houses )
  end
end
