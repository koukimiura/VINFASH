class Talk < ApplicationRecord
    validates :content, {presence: true}
    belongs_to :entry
    belongs_to :user
    has_many :notifications, :dependent => :destroy
end
