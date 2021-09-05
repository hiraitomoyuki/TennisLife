class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :circlue_visitor_id
      t.integer :circlue_visited_id
      t.integer :article_id
      t.integer :comment_id
      t.integer :schedule_id
      t.integer :favorite_id
      t.integer :entry_id
      t.integer :approval_id
      t.integer :follower_id
      t.integer :followed_id
      t.string :action, default: "", null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
    
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :circlue_visitor_id
    add_index :notifications, :circlue_visited_id
    add_index :notifications, :article_id
    add_index :notifications, :comment_id
    add_index :notifications, :schedule_id
    add_index :notifications, :favorite_id
    add_index :notifications, :entry_id
    add_index :notifications, :follower_id
    add_index :notifications, :followed_id
    add_index :notifications, :approval_id
  end
end
