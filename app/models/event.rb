class Event < ApplicationRecord
    validates :title, {presence: true }
    validates :location, {presence: true }
    validates :content, {presence: true }
    validates :user_id, {presence: true}
    mount_uploader :image, ImageUploader
    
    belongs_to :user
    has_many :likes, :dependent => :destroy
    has_many :messages, :dependent => :destroy
    has_many :notifications, :dependent => :destroy
end
