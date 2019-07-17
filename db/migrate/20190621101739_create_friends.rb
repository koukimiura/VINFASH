class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :follower
      t.integer :followed
      t.timestamps
    end
  end
end
