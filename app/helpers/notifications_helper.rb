module NotificationsHelper
    
    def test(notification)
        visiter_record = User.find(notification.visiter_id)
        #visiter_record = User.find(3)
        your_post_record = Post.find(notification.post_id)
        #your_event_record = Event.find(3)
        your_post_record = Event.find_by(id: notification.event_id)
        
        
        logger.debug("---------#{visiter_record.name}----------#{visiter_record.id}")
        visiter = link_to visiter_record.name, visiter_record.id
        your_post = link_to "あなたの投稿", your_post_record.id
        your_event = link_to "あなたのイベント", your_event_record.id
        #notification.action= "post_like"
            case notification.action
                when "post_like" then
                   result= "#{visiter}が#{your_post}にいいねしました。"
                when "event_like" then
                   result= "#{visiter}が#{your_event}にいいねしました。"
                when "m_on_post" then
                 result= "#{visiter}が#{your_post}にコメントしました。" if @message = Message.find_by(id: notification.message_id)
                when "m_on_event" then
                  result= "#{visiter}が#{your_event}にコメントしました。" if @message = Message.find_by(id: notification.message_id)
            end   
            return result
    end
end
