class RemoveUserIdFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :user_id, :integer
  end
end
