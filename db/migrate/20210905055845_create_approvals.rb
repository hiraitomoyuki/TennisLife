class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.integer :user_id, null: false
      t.integer :circle_id, null: false
      t.integer :schedule_id

      t.timestamps
    end
  end
end
