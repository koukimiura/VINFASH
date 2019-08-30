class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :forbid_login_user
    
    def create
        @message = Message.create(message_params)
            
        if @message.post_id?
            @post = Post.find(@mesage.post_id)
            @notification = Notification.new(
                visiter_id: @message.user_id,
                visited_id: @post.user_id,
                post_id: @post.id,
                messsage_id: @message.id,
                action: "m_on_post"
                )
            @notificatioz.save if notification.valid?
        end
       
       if @message.event_id?
            @event = Event.find(@mesage.event_id)
            @notification = Notification.new(
                visiter_id: @message.user_id,
                visited_id: @event.user_id,
                event_id: @event.id,
                messsage_id: @message.id,
                action: "m_on_event"
                )
            @notificatioz.save if notification.valid?
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
