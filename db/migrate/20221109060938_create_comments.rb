class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :customer_id, null: false #会員ID
      t.integer :post_id, null: false #投稿ID
      t.text :text, null: false #コメント本文
      t.integer :release_status, null: false #公開ステータス

      t.timestamps
    end
  end
end
