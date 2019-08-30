class Message < ApplicationRecord
    validates :content, {presence: true}
    validates :user_id, presence: true
    validates :post_id, presence: true, if: :event_id?
    validates :event_id, presence: true, if: :post_id?
    
    
    def event_id?
        event_id == nil
    end
    
    
    def post_id?
         post_id == nil
    end
    
    
    
    belongs_to :user
    belongs_to :post
    belongs_to :event
    has_many :notifications, :dependent => :destroy
end
