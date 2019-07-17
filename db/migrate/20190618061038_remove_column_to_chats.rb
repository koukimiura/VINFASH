class RemoveColumnToChats < ActiveRecord::Migration[5.0]
  def change
    remove_column :chats, :user_id, :integer
  end
end
