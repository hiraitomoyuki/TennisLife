class RemoveEventIdFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :event_id, :integer
  end
end
