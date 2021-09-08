class RemoveCirclueVisitedIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :circlue_visited_id, :integer
  end
end
