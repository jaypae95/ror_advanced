class AddUsernameColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :username, :string
  end
end
