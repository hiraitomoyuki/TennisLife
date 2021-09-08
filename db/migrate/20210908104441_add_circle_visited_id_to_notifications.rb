class AddCircleVisitedIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :circle_visited_id, :integer
  end
end
