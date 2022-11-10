class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :customer_id, null: false #会員ID
      t.integer :genre_id, null: false #投稿ジャンルID
      t.string :title, null: false #投稿タイトル
      t.text :body, null: false #投稿本文
      t.integer :release_status, null: false #公開ステータス

      t.timestamps
    end
  end
end
