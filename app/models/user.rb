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
         
         
         def self.find_for_oauth(auth)
          
          user = User.where(uid: auth.uid, provider: auth.provider).first
          return user
           
         end
         
         def self.create_for_oauth(auth)
             user = User.create(
                 uid:      auth.uid,
                 provider: auth.provider,
                 email:    auth.info.email,
                 name: auth.info.name,
                 #パスワードを作る
                 password: Devise.friendly_token[0, 20]
              )
             return user
         end
end
