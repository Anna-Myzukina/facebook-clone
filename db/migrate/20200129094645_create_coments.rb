class CreateComents < ActiveRecord::Migration[5.1]
  def change
    create_table :coments do |t|
      t.integer :coment_id
      t.integer :post_id_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
