class AddCircleVisitorIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :circle_visitor_id, :integer
    add_index :notifications, :circle_visitor_id
  end
end
