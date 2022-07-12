class CreatePostLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_likes do |t|
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end

    add_index :post_likes, [:user_id, :post_id], unique: true
  end
end
