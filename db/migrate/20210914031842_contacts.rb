class Contacts < ActiveRecord::Migration[5.2]
  def change
    drop_table :contacts
  end
end
