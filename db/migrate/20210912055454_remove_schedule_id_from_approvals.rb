class RemoveScheduleIdFromApprovals < ActiveRecord::Migration[5.2]
  def change
    remove_column :approvals, :schedule_id, :integer
  end
end
