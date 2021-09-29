class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Circle"
  belongs_to :followed, class_name: "Circle"

end
