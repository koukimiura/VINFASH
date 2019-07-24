class Entry < ApplicationRecord
    validates :user_id, {presence: true}
    validates :chat_id, {presence: true}
    
    belongs_to :user
    belongs_to :chat
    has_many :talks, :dependent => :destroy
    
end
