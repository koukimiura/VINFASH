class CreateMyConsumptions < ActiveRecord::Migration[5.0]
  def change
    create_table :my_consumptions do |t|
        t.integer :user_id
        t.integer :consumption_id
      t.timestamps
    end
  end
end
