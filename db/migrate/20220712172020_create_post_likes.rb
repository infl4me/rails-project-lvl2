# frozen_string_literal: true

class CreatePostLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_likes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false

      t.timestamps
    end

    add_index :post_likes, %i[user_id post_id], unique: true
  end
end
