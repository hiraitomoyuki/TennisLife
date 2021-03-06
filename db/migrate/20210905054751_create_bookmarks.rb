class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id, null: false
      t.integer :circle_id, null: false

      t.timestamps
      
      t.index [:user_id, :circle_id], unique: true
    end
  end
end
