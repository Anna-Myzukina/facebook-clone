class AddToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user_id, :integer 
    add_column :posts, :post_id, :integer 
    add_column :posts, :coment_id, :integer 
  end
end
