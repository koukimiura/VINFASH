class TalksController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    
    def create
        @talk = Talk.create(params_talk)
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
