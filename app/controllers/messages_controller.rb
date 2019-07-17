class MessagesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    
    def create
        @message = Message.create(message_params)
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
