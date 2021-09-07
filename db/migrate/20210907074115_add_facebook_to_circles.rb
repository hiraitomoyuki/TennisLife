class AddFacebookToCircles < ActiveRecord::Migration[5.2]
  def change
    add_column :circles, :facebook, :string
  end
end
