class ChangeColumnForUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :area_id, :integer
    remove_column :users, :my_area_id, :integer
  end
end
