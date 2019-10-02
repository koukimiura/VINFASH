class ChangeColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :shoe_id, :integer
    add_column :users, :consumption_id, :integer
  end
end
