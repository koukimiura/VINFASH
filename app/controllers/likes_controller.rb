class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    
    def create
        @like= Like.new(
            user_id: current_user.id,
            post_id: params[:post_id]
    )
    logger.debug("================= create = #{params[:post_id]}")
        if @like.save
            redirect_to post_path(params[:post_id])
        end
    end
    
    def destroy
        @like = Like.find_by(
            user_id: current_user.id,
            post_id: params[:post_id]
            )
         @like.destroy
            redirect_to post_path(params[:post_id])
    end
    
    
    def create_event
        @like = Like.new(
            user_id: current_user.id,
            event_id: params[:event_id]
            )
        if @like.save
            redirect_to event_path(params[:event_id])
        end
    end
    
    def destroy_event
       @like = Like.find_by(
           user_id: current_user.id,
           event_id: params[:event_id]
           )
            @like.destroy
            redirect_to event_path(params[:event_id])
    end
end
