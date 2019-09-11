class Notification < ApplicationRecord
    
    
    belongs_to :event
    belongs_to :post
    belongs_to :message
    belongs_to :chat
    belongs_to :talk
    
    #validates :post_id_or_event_id_or_talk_id, presence: true, allow_nil: true
    #validates :event_id, presence: true, allow_nil: true, if :event_id?
    #validates :talk_id, presence: true, allow_nil: true, if :talk_id
    
   
    
    #def validates(notification)
        #items = [notification.post_id, notification.event_id, talk_id]
        #return items.any?
    #end
    
    
    #validates :event_id, presence: true, allow_nil: true
    
    #validates :post_id_or_event_id_or_message_id_or_chat_id_or_talk_id, presence: true
    
    #def post_id_or_event_id_or_message_id_or_chat_id_or_talk_id
        
       #post_id.presence or event_id.presence or message_id.presencev or chat_id.present or talk_id.present
        
    #end
    
end
