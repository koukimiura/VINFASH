class AddColumnToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :name, :string
  end
end
