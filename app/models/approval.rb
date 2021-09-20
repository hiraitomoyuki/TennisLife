class Approval < ApplicationRecord
  belongs_to :user
  belongs_to :circle
  
  #通知機能
  def create_notification_approval(current_user)
    notification = current_user.active_notifications.new(approval_id: id, circle_visited_id: circle_id, action: "approval")
    notification.save if notification.valid?
  end
end
