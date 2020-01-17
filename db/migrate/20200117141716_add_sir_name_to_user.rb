class AddSirNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sirname, :string
  end
end
