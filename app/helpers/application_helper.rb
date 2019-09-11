module ApplicationHelper
    
     def unchecked_notifications
          @notifications = Notification.where(visited_id: current_user.id)
                                       .where(action: ["post_like","event_like","m_on_post","m_on_event"])
                                        .where(check: false)
     end
    
     def unchecked_notifications_friends
          @notifications = Notification.where(visited_id: current_user.id)
                                       .where(action: "F")
                                        .where(check: false)
     end
     
     
     def unchecked_notifications_chats
         @notifications = Notification.where(visited_id: current_user.id)
                                       .where(action: "T")
                                        .where(check: false)
     end
end
