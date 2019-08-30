class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|

      t.timestamps
      t.integer :visiter_id
      t.integer :visited_id
      t.integer :post_id
      t.integer :event_id
      t.integer :message_id
      t.integer :chat_id
      t.integer :talk_id
      t.string :action
      t.boolean :check, default: false
    end
  end
end
