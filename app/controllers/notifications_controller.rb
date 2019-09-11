class NotificationsController < ApplicationController
    
    PER = 8
    def post_event_index
        @notifications = Notification.where(visited_id: current_user.id)
                                     .where(action: ["post_like","event_like","m_on_post","m_on_event"])
                                     .order(created_at: :desc)
                                     .page(params[:page]).per(PER)
                            #6行目, IN句を使い任意の値をexploit
            #.where(action: ["post_like","event_like","m_on_post","m_on_event" ])
        #上のデータあり　checkをfalse => true
        #@notifications.where(check: false).each do |notification|
            #notification.update_attribute(check: true)
       # end
    end
    
    
    def friends_index
        @notifications = Notification.where(visited_id: current_user.id)
                                     .where(action: "F")
                                     .order(created_at: :desc)
                                     .page(params[:page]).per(PER)
    end
    
    def chats_index
        @notifications = Notification.where(visited_id: current_user.id)
                                     .where(action: "T")
                                     .order(created_at: :desc)
                                     .page(params[:page]).per(PER)
    end
    
end
