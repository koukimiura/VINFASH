class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :shoes do |t|
        t.string :size
      t.timestamps
    end
  end
end
