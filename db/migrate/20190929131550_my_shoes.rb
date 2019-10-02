class MyShoes < ActiveRecord::Migration[5.0]
  def change
    drop_table :my_shoes
  end
end
