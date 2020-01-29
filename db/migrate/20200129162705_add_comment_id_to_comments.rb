class AddCommentIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :comment_id, :integer
  end
end
