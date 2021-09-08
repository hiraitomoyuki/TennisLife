class Schedule < ApplicationRecord
  belongs_to :circle
  
  has_many :entries
  has_many :entry_users, through: :entries, source: :user
  has_many :notifications, dependent: :destroy
  
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_before_start_date
  
  def entry_by?(user)
    entries.where(user_id: user.id).exists?
  end
  
  def end_date_before_start_date
    erros.add(:end_date, "は開始日時以降にしてください。") if end_date < start_date
  end
  
  def create_notification_schedule(current_user)
    notification = current_user.active_notifications.new(schedule_id: id, circle_visited_id: circle_id, action: "schedule")
    notification.save if notification.valid?
  end
end
