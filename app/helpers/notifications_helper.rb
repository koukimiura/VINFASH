module NotificationsHelper
    # 投稿コメントといいね
    def test(notification)
        @message = nil # @messageをnilにしていないとhtmlの@messageに値が入ってしまう。
        visiter_record = User.find_by(id: notification.visiter_id)
        #visiter = notification.visiter_id
        #visiter_record = User.find(3)
        your_post_record = Post.find_by(id: notification.post_id)
        #your_event_record = Event.find(3)
        your_event_record = Event.find_by(id: notification.event_id)
        
        #このlogger.debugは正常に値が入っているか
        #logger.debug("---------#{notification.visiter_record.name}----------#{visiter_record.id}")
        visiter = link_to visiter_record.name, user_path(visiter_record.id)
        
        if your_post_record #nilをはじく
            your_post = link_to "あなたの投稿", post_path(your_post_record.id)
        end
        
        if your_event_record #nilをはじく
            your_event = link_to "あなたのイベント", event_path(your_event_record.id)
        end
                
            case notification.action
                when "post_like" then
                    "#{visiter}さんが#{your_post}にいいねしました。"
                when "event_like" then
                    "#{visiter}さんが#{your_event}にいいねしました。"
                when "m_on_post" then
                    "#{visiter}さんが#{your_post}にコメントしました。" if @message = Message.find_by(id: notification.message_id)
                when "m_on_event" then
                    "#{visiter}さんが#{your_event}にコメントしました。" if @message = Message.find_by(id: notification.message_id)
            end   
            #return result
    end
    
    # 友達
   def test_2(notification) 
       visiter_record = User.find_by(id: notification.visiter_id)
       visited_record = User.find_by(id: notification.visited_id) #curren_user
       
       if visiter_record #nilをはじく
            visiter = link_to visiter_record.name, user_path(visiter_record.id)
       end
       
       if visiter_record #nilをはじく
            visited = link_to visited_record.name, user_path(visited_record.id)
       end
       
        if Friend.find_by(follower: visiter_record.id, followed: notification.visited_id) &&
            Friend.find_by(follower: notification.visited_id, followed: visiter_record.id)
          "#{visiter}さんが友達申請を承認しました。"
          #visited_idがconntrollercurrent_user.idになってしまっているため
        #if  Friend.find_by(follower: visiter_record.id, followed: notification.visited_id) &&
            #!Friend.find_by(follower: notification.visited_id, followed: visiter_record.id)
        else
           "#{visiter}さんが#{visited}に友達申請しています。"
        end
        
   end  
   
   # chats_index
   def test_3(notification)
       visiter = User.find_by(id: notification.visiter_id)
       @talk = Talk.find_by(id: notification.talk_id)
       
       if notification.action = "T"
           "#{visiter.name}からメッセージがあります。" if @talk = Talk.find_by(id: notification.talk_id)
       end
   end
   
   
  
end
