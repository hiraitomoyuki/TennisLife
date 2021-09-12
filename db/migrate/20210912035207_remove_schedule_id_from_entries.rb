class RemoveScheduleIdFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :schedule_id, :integer
  end
end
