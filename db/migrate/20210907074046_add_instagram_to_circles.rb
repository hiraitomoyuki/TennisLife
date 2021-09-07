class AddInstagramToCircles < ActiveRecord::Migration[5.2]
  def change
    add_column :circles, :instagram, :string
  end
end
