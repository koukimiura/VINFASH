class AddColumnToMyShoes < ActiveRecord::Migration[5.0]
  def change
    add_column :my_shoes, :shoe_id, :integer
  end
end
