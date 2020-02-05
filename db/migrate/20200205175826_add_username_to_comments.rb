class AddUsernameToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :username, :string
  end
end
