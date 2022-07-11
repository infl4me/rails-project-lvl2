class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.references :post, null: false, foreign_key: true
      t.text :content
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
