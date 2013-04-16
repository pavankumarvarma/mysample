class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :userid
      t.integer :friendid

      t.timestamps
    end
  end
end
