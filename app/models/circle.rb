class Circle < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :approvals, dependent: :destroy
  
  has_many :active_circle_notifications, class_name: "Notification", foreign_key: "circle_visitor_id", dependent: :destroy
  has_many :passive_circle_notifications, class_name: "Notification", foreign_key: "circle_visited_id", dependent: :destroy
  
  
  validates :name, presence: true
  validates :theme, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :prefecture_code, presence: true
  validates :entry_fee, presence: true
  validates :members_wanted, inclusion: { in: [true, false] }
  
  attachment :image
  
  #住所自動入力機能
  include JpPrefecture
  jp_prefecture :prefecture_code, method_name: :pref
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_circle, through: :follower, source: :followed
  has_many :follower_circle, through: :followed, source: :follower
  
  def follow(circle_id)
    follower.create(followed_id: circle_id)
  end
  
  def unfollow(circle_id)
    follower.find_by(followed_id: circle_id).destroy
  end
  
  def following?(circle)
    following_circle.include?(circle)
  end
  
  def matchers
    Circle.where(id: follower.select(:followed_id)).where(id: followed.select(:follower_id))
  end
  
  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
  
  def create_notification_follow(current_user)
    temp = Notification.where(["circle_visitor_id = ? and circle_visited_id = ? and action = ? ",current_user.circle.id, id, "follow"])
    if temp.blank?
      notification = current_user.circle.active_circle_notifications.new(circle_visited_id: id, action: "follow" )
      notification.save if notification.valid?
    end
  end
end
