class NotificationsController < ApplicationController
    
    
    def post_event_index
        @notifications = Notification.where(visited_id: current_user.id).order(created_at: :desc)
        #上のデータあり　checkをfalse => true
        #@notifications.where(check: false).each do |notification|
            #notification.update_attribute(check: true)
        #end
    end
    
    
    def friends_index
        @notifications = Notification.where(visited_id: current_user.id).order(created_at: :desc)
    end
    
end
