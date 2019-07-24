class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         #validates :name, {presence: true}, length: { maximum: 25 }
         #validates :birthday, {presence: true}
         #validates :gender, {presence: true}
         #validates :my_size, {presence: true}
         #validates :my_height, {presence: true}
         #validates :genre, {presence: true}, length: { maximum: 25 }
         
          mount_uploader :image, ImageUploader
         
         has_many :posts, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :events, dependent: :destroy
         has_many :messagess, dependent: :destroy
         has_many :entries, dependent: :destroy
         has_many :talks, dependent: :destroy
         
         has_many :my_areas, dependent: :destroy
         has_many :my_shoes, dependent: :destroy
         accepts_nested_attributes_for :my_shoes#, allow_destroy: true 
         has_many :my_consumptions, dependent: :destroy
         accepts_nested_attributes_for :my_consumptions#, allow_destroy: true
end
