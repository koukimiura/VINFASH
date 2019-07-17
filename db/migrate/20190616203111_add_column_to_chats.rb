class AddColumnToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :user_id, :integer
    remove_column :chats, :name, :string
  end
end
