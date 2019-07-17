class ChageColumnToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :name, :string
  end
end
