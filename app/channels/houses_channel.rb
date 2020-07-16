class HousesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "houses_channel_#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
