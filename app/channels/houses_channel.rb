class HousesChannel < ApplicationCable::Channel
  def subscribed
    # stream_for "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
