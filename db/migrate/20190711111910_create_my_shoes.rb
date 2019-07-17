class CreateMyShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :my_shoes do |t|
          t.integer :size
          t.integer :user_id
      t.timestamps
    end
  end
end
