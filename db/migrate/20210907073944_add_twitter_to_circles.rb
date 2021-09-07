class AddTwitterToCircles < ActiveRecord::Migration[5.2]
  def change
    add_column :circles, :twitter, :string
  end
end
