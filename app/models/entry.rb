class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  
  def create_notification_entry(current_user)
    temp = Notification.where([
      "visitor_id = ? and circle_visited_id = ? and schedule_id = ? and entry_id = ? and action = ?",
      current_user.id, schedule.circle_id, schedule_id,
    ])
    
    if temp.blank?
      notification = current_user.active_notifications.new(schedule_id: schedule_id, entry_id: id, circle_visited_id: schedule.circle_id, action: "entry")
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
