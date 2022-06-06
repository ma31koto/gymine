class AddOpeningHourToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :opening_hour, :string
  end
end
