class AddPhoneNumberToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :phone_number, :integer
  end
end
