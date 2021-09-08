class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :article, optional: true
  belongs_to :comment, optional: true
  belongs_to :schedule, optional: true

  belongs_to :visitor, class_name: "User", foreign_key: "visitor_id", optional: true
  belongs_to :visited, class_name: "User", foreign_key: "visiteed_id", optional: true

  belongs_to :circle_visitor, class_name: "Circle", foreign_key: "circle_visitor_id", optional: true
  belongs_to :circle_visited, class_name: "Circle", foreign_key: "circle_visited_id", optional: true
end
