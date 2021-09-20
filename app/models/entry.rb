class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :event

  #通知
  def create_notification_entry(current_user)
    #参加済みか判定
    temp = Notification.where([
      "visitor_id = ? and circle_visited_id = ? and event_id = ?
									and entry_id = ? and action = ?",
      current_user.id, event.circle_id, event_id,
      id, 'entry',
    ])
    
    #未参加なら通知
    if temp.blank?
      notification = current_user.active_notifications.new(event_id: event_id, entry_id: id, circle_visited_id: event.circle_id, action: "entry")
      #自分が作成した予定に参加なら通知済み
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
