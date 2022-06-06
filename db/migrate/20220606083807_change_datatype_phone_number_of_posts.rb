class ChangeDatatypePhoneNumberOfPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :phone_number, :string
  end
end
