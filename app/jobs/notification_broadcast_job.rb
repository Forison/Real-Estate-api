class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(house_id)

    # ActionCable.server.broadcast('houses_channel', houses )
  end
end
