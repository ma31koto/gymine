class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :postal_code
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :name
      t.text :introduction
      t.integer :area_id
      t.timestamps
    end
  end
end
