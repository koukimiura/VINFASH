class RemoveColumnFromEntries < ActiveRecord::Migration[5.0]
  def change
    remove_column :entries, :name, :string 
  end
end
