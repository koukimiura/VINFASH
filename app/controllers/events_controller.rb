class EventsController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :show, :create, :edit, :update, :destroy]
    
    def index
        @events = Event.all.order(created_at: :desc)
    end
    
    def show
        @event = Event.find(params[:id])
        @like = Like.new
        @like_count = Like.where(event_id: @event.id).count
        @message = Message.new
        @messages = Message.where(event_id: @event.id)
    end
    
    def new
        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        if @event.save
        flash[:notice] = '投稿しました。'
        redirect_to events_path
        else
        flash[:alert] = '投稿できませんでした。'
        render 'events/new'
        end
    end
    
    def edit 
         @event = Event.find(params[:id])
    end
    
    def update
         @event = Event.find(params[:id])
        if @event.update(event_params)
        redirect_to events_path
        else
        render 'events/edit'
        end
    end
    
    def destrory
         @event = Event.find(params[:id])
         @event = @event.destroy
         redirect_to events_path
    end
    
    
    def event_params
        params.require(:event).permit(:title, :content, :image, :location, :user_id).merge(:user_id => current_user.id)
    end
end
