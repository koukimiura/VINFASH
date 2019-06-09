class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
          mount_uploader :image, ImageUploader
         
         has_many :posts
         has_many :my_areas
         has_many :likes
         has_many :events
end