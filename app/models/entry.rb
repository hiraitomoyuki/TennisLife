class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def create_notification_entry(current_user)
    temp = Notification.where([
      "visitor_id = ? and circle_visited_id = ? and event_id = ?
									and entry_id = ? and action = ?",
      current_user.id, event.circle_id, event_id,
      id, 'entry',
    ])

    if temp.blank?
      notification = current_user.active_notifications.new(event_id: event_id, entry_id: id, circle_visited_id: event.circle_id, action: "entry")
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
