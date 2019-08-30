class TalksController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :forbid_login_user
    
    def create
        @talk = Talk.create(params_talk)
        @entry = Entry.find(@talk.entry_id)
        @entry2 = Entry.find_by(chat_id: @entry.chat_id)
        @notification = Notification.new(
            visiter_id: @talk.user_id,
            visited_id: @entry2.user_id,
            chat_id: @entry2.chat_id,
            talk_id: @talk.id,
            action: "T"
            )
         @notification.save if notification.valid?
        redirect_to :back
    end
    
    def destroy
        @talk = Talk.find(params[:id])
        @talk.destroy
    end
    
    private
    
    def params_talk
        params.require(:talk).permit(:content, :entry_id, :user_id).merge(user_id: current_user.id)
    end
    
end
