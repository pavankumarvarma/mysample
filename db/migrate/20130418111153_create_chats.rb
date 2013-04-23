class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :userid
      t.integer :friendid

      t.timestamps
    end
  end
end
