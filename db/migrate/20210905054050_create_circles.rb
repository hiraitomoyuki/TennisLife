class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.string :name, null: false
      t.string :email
      t.string :theme, null: false
      t.integer :prefecture_code, null: false
      t.integer :postal_code, null: false
      t.string :address, null: false
      t.string :practice_day
      t.integer :number_of_people
      t.string :entry_fee, null: false
      t.boolean :members_wanted, null: false
      t.text :crrently_recruiting_player
      t.text :introduction
      t.string :homepage_url
      t.string :image_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
