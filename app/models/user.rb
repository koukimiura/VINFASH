class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         #validates :name, {presence: true}
         #validates :gender, {presence: true}
         #validates :birthday, {presence: true}
         #validates :genre, {presence: true}
         
          mount_uploader :image, ImageUploader
         
         has_many :posts, :dependent => :destroy
         has_many :my_areas, :dependent => :destroy
         has_many :likes, :dependent => :destroy
         has_many :events, :dependent => :destroy
         has_many :messagess
         has_many :entries, :dependent => :destroy
         has_many :talks
         has_many :my_shoes, :dependent => :destroy
         accepts_nested_attributes_for :my_shoes, allow_destroy: true
end
