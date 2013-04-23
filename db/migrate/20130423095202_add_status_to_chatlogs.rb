class AddStatusToChatlogs < ActiveRecord::Migration
  def change
    add_column :chatlogs, :status, :string

  end
end
