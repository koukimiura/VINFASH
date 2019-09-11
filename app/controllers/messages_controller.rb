class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :forbid_login_user
    
    def create
        @message = Message.new(message_params)
        if @message.save
            @post = Post.find_by(id: @message.post_id)
            @event = Event.find_by(id: @message.event_id)
            #@relay_notifications = Notification.where(visited_id: @message.user_id, post_id: @post.id, action: "m_on_post")
        end
        
        if @post && @message.user_id != @post.user_id
            @notification = Notification.new(
                visiter_id: @message.user_id,
                visited_id: @post.user_id,
                post_id: @post.id,
                message_id: @message.id,
                action: "m_on_post"
                )
            @notification.save 
        end
       
       if @event && @message.user_id != @event.user_id
            @notification = Notification.new(
                visiter_id: @message.user_id,
                visited_id: @event.user_id,
                event_id: @event.id,
                message_id: @message.id,
                action: "m_on_event"
                )
            @notification.save
       end
       
       redirect_to :back
    end
    
    
    
    
    def destroy
        @message = Message.find(params[:id])
        @message.destroy
    
        redirect_to :back
    end
    
    
    private
    
    def message_params
        params.require(:message).permit(:content, :user_id, :post_id, :event_id).merge(user_id: current_user.id)
    end
    
end
