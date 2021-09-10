class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :notifications, dependent: :destroy
  
  validates :comment, presence: true
  
  def create_notification_comment(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(article_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment(current_user, comment_id, temp_id["uesr_id"])
    end
    save_notification_comment(current_user, comment_id, user_id) if temp_ids.blank?
  end
  
  def save_notification_comment(current_user, comment_id, circle_visited_id)
    notification = current_user.active_circle_notifications.new(article_id: id, comment_id: comment_id, circle_visited_id: circle_visited_id, action: "comment")
    
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
