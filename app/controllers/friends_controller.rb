class FriendsController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destroy]

  def create
        @friend = Friend.create(friend_params)
        redirect_to :back
        flash[:notice] = '申請しました。'
  end
    
  def destroy
        @friend = Friend.find_by(follower: current_user.id, followed: params[:id])
        @friend.destroy
        flash[:info] = 'Unfollow'
        redirect_to :back
  end
    
  private
    
  def friend_params
        params.require(:friend).permit(:follower, :followed).merge(follower: current_user.id)
  end
    
    
end
