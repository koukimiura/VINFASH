class Notification < ApplicationRecord
    
    validates :post_id_or_event_id_or_message_id_or_chat_id_or_talk_id, presence: true
    
    def post_id_or_event_id_or_message_id_or_chat_id_or_talk_id
        
       post_id.presence or event_id.presence or message_id.presencev or chat_id.present or talk_id.present
        
    end
end
