class Article < ApplicationRecord
  belongs_to :circle
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  attachment :image
  
  validates :title, presence: true
  validates :body, presence: true
  
  #タグ
  acts_as_taggable
  
  #いいね
  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  #通知
  def create_notification_article(current_user)
    notification = current_user.active_notifications.new(article_id: id, circle_visited_id: circle_id, action: "article")
    notification.save if notification.valid?
  end
end
