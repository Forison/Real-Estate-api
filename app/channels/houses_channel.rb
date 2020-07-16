class HousesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "houses_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
