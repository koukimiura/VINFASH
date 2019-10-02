class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :name, length: { maximum: 25 }, presence: true, on: :update
         validates :birthday, presence: true, on: :update
         validates :gender, presence: true, on: :update
         validates :my_size, presence: true, on: :update
         validates :my_height, presence: true, on: :update
         validates :genre, length: { maximum: 25 }, presence: true,  on: :update
         validates :self_introduction,presence: true, on: :update
         validates :shoe_id, presence: true, on: :update
         validates :shoe_id, presence: true, on: :update
         
          mount_uploader :image, ImageUploader
         
         has_many :posts, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :events, dependent: :destroy
         has_many :messagess, dependent: :destroy
         has_many :entries, dependent: :destroy
         has_many :talks, dependent: :destroy
         has_many :my_areas, dependent: :destroy
         has_many :user1,  class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
         has_many :user2,  class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
         belongs_to :shoe
         belongs_to :consumption
         
         
         #has_many :my_shoes, dependent: :destroy#, inverse_of: :my_shoes
         #accepts_nested_attributes_for :my_shoes, allow_destroy: true 
        # has_many :my_consumptions, dependent: :destroy#, inverse_of: :my_consumptions
         #accepts_nested_attributes_for :my_consumptions, allow_destroy: true
         
         
         #has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
         #has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
end
