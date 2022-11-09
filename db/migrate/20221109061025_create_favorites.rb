class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      t.integer :customer_id, null: false #会員ID
      t.integer :post_id, null: false #投稿ID

      t.timestamps
    end
  end
end
