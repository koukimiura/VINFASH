class FriendsController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destroy]
  before_action :forbid_login_user

  def create
        @friend = Friend.create(friend_params)
        @notifcation=Notification.new(
          visiter_id: @friend.follower,
          visited_id: @friend.followed,
          action: "F"
          )
        @notifcation.save
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
