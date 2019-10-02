class TalksController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :forbid_login_user
    
    def create
        @talk = Talk.new(params_talk)
        if @talk.save
            @entry = Entry.find_by(id: @talk.entry_id)
            @anotherEntries = Entry.where(chat_id: @entry.chat_id).where.not(user_id: @talk.user_id).limit(1)
            @anotherEntries.each do |an|
                if an.user_id != @talk.user
            @notification = Notification.new(
                visiter_id: @talk.user_id,
                visited_id: an.user_id,
                chat_id: @entry.chat_id,
                talk_id: @talk.id,
                action: "T"
                )
             @notification.save 
           
                end
            end
        end
        redirect_to :back
    end
    

    def destroy
        @talk = Talk.find_by(id: params[:id])
        @talk.destroy
        redirect_to :back
    end
    
    private
    def params_talk
        params.require(:talk).permit(:content, :entry_id, :user_id).merge(user_id: current_user.id)
    end
    
end
