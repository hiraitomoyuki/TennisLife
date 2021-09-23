class Topic < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
  belongs_to :user
  
  has_many :posts, dependent: :destroy
  
  validates :title, presence: true
end
