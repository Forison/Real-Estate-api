class BroadcastNotificationJob < ApplicationJob
  queue_as :default

  def perform(notification_id)
    notification = Notification.find_by_id(notification_id)
    return unless notification.present?
    channel = notification.user_id.present? ? "notification_channel_user_#{notification.user_id}" : "notification_channel"
    ActionCable.server.broadcast(channel, message: render_notification(notification))
  end
  
  private
  def render_notification(notification)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: notification })
  end
end
