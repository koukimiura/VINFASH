class ChageColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    #remove_column :users, :profile_image_cache, :string 
    rename_column :users, :profile_image, :image
  end
end



#remove_column :users, :image_cacheprofile_, :string
#remove_column :users, :image_cacheprofile_, :string
#remove_column :users, :profile_remove_image, :string
#remove_column :users, :area_id, :integer
#remove_column :users, :my_area_id, :integer
#remove_column :users, :my_shoes_size, :string
#remove_column :users, :my_price, :integer

#profile_image_cache