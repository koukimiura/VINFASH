class RemoveColumnFromConsumption < ActiveRecord::Migration[5.0]
  def change
    remove_column :consumptions, :user_id, :integer
  end
end
