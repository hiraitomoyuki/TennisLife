class AddEventIdToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :event_id, :integer
  end
end
