class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :article
  
  def create_notification_favorite(current_user)
    temp = Notification.where([
      "visited_id = ? and circle_visited_id = ? and article_id = ? and favorite_id = ? and action = ?",
      current_user.id, article,circle_id, article_id, id, "favorite"
    ])
      
    if temp.blank?
      notification = current_user.active_notifications.new(article_id: article_id, favorite_id: id, circle_visited_id: article.circle_id, action: "favorite")
      
      if notification.visitor_id == notification.visited_id
        notification.checked == true
      end
      notification.save if notification.valid?
    end
  end  
end
