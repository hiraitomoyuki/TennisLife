class AddEventIdToApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :approvals, :event_id, :integer
  end
end
