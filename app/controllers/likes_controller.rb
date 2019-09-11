class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :forbid_login_user
    def create
        @post = Post.find(params[:post_id])
        @like= Like.new(
            user_id: current_user.id,
            post_id: params[:post_id]
            )
            
    logger.debug("================= create = #{params[:post_id]}")
        if @like.save
        @notification = Notification.new(
            visiter_id: @like.user_id,
            visited_id: @post.user_id,
            post_id: @post.id,
            action: "post_like"
            )
        @notification.save 
        
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
        @event = Event.find(params[:event_id])
        @like = Like.new(
            user_id: current_user.id,
            event_id: params[:event_id]
            )
        if @like.save
            @notification = Notification.new(
                visiter_id: @like.user_id,
                visited_id: @event.user_id,
                event_id: @event.id,
                action: "event_like"
                )
            @notification.save 
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
