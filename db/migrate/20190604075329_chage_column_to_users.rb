class ChageColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    #remove_column :users, :profile_image_cache, :string 
    rename_column :users, :profile_image, :image
  end
end



