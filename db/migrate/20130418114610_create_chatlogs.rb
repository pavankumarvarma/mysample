class CreateChatlogs < ActiveRecord::Migration
  def change
    create_table :chatlogs do |t|
      t.integer :chatid
      t.integer :userid
      t.text :message

      t.timestamps
    end
  end
end
