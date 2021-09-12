class RemoveScheduleIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :schedule_id, :integer
  end
end
