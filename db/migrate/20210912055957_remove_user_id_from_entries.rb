class RemoveUserIdFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_index :entries, :user_id
    remove_column :entries, :user_id, :string
  end
end
