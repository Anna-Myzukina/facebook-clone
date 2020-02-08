class Posts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    t.string :body
    t.references :user, foreign_key: true
    
    t.timestamps
  end
    add_index :posts, %i[user_id created_at]
  end
end
