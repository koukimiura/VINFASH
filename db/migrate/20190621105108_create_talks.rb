class CreateTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :talks do |t|
        t.integer :entry_id
        t.text :content
      t.timestamps
    end
  end
end
