class RemoveCirclueVisitorIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :circlue_visitor_id, :integer
  end
end
