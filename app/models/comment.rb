class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :notifications, dependent: :destroy
  
  validates :comment, presence: true
  
  def create_notification_comment(current_user, comment_id)
    # 自分以外のコメントしている人に通知
    temp_ids = Comment.select(:user_id).where(article_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment(current_user, comment_id, temp_id['user_id'])
    end
    # だれもコメントしていなければ投稿者に通知
    save_notification_comment(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment(current_user, comment_id, team_visited_id)
    # 1つの投稿に複数回通知
    notification = current_user.active_notifications.new(
      article_id: id,
      comment_id: comment_id,
      circle_visited_id: circle_visited_id,
      action: 'comment'
    )

    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end