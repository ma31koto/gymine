class AddAccessToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :access, :string
  end
end
