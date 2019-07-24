class RemoveColumnFUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :my_shoes_size, :string
    remove_column :users, :my_price, :integer
  end
end
