class Post < ApplicationRecord
     validates :user_id, {presence: true}
     validates :title, {presence: true}
     validates :content, {presence: true}
     mount_uploader :image, ImageUploader
     
     belongs_to :user
     has_many :likes, :dependent => :destroy
     has_many :messages, :dependent => :destroy
end
