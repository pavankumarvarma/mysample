class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :userid
      t.string :title
      t.text :post

      t.timestamps
    end
  end
end
