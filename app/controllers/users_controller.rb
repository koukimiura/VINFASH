class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :likes, :likes_events, :events, :following, :followers]
  before_action :ensure_correct_user, only:[:chats]
 
  
  def show
    @user = User.find(params[:id])
    @chat = Chat.new
    @friend = Friend.new
    @entry = @chat.entries.build
    @friend_following = Friend.where(follower: @user.id).count
    @friend_followers = Friend.where(followed: @user.id).count
    @relationship = "友人レベル"
    
    @current_userEntries = Entry.where(user_id: current_user.id)
    @userEntries = Entry.where(user_id: @user.id)
    
    @current_userEntries.each do |cu|
      @userEntries.each do |u|
        if cu.chat_id == u.chat_id
             @isChat = true
             @chatId = cu.chat_id
        end
      end
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
    @chat = Chat.new
    @entry = @chat.entries.build
    @frind = Friend.new
    @friend_following = Friend.where(follower: @user.id).count
    @friend_followers = Friend.where(followed: @user.id).count
    @relationship = "友人レベル"
  end
  
  def likes_events
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
    @chat = Chat.new
    @entry = @chat.entries.build
    @frind = Friend.new
    @friend_following = Friend.where(follower: @user.id).count
    @friend_followers = Friend.where(followed: @user.id).count
    @relationship = "友人レベル"
  end
  
  
  
  def events
    @user = User.find(params[:id])
    @chat = Chat.new
    @entry = @chat.entries.build
    @frind = Friend.new
    @friend_following = Friend.where(follower: @user.id).count
    @friend_followers = Friend.where(followed: @user.id).count
    @relationship = "友人レベル"
  end
  
  
  def chats
    @user = User.find(params[:id])
    #一覧（相手の名前を出す。）
     #each文配列をmyRoomIds代入
      myChatIds = []
        #current_userのレコードを取得
        #current_userのレコードchat_idと同じchat.idを取得
        Entry.where(user_id: @user.id).each do |e|
          if Chat.find(e.chat_id)
            myChatIds.push(e.chat_id)
          end
        end
       #current_user.chat_idと同じchat_idを探してuser.id != current_user_idとする
      @anotherEntries = Entry.where(chat_id: myChatIds).where('user_id != ?', @user.id)
                                                          #where.not
    #一覧（相手の名前を出す。）
        #current_userのレコードを取得
       #@currentEntries = Entry.where(user_id: @user.id)
       #each文配列をmyRoomIds代入
       #myChatIds = []
       #current_userのレコードchat_idと同じchat.idを取得
       #@currentEntries.each do |e|
       #myChatIds << e.chat.id
       #end
       #current_user.chat_idと同じchat_idを探してuser.id != current_user_idとする
       #@anotherEntries = Entry.where(chat_id: myChatIds).where('user_id != ?', @user.id)
                                                          #where.not
       #talk一覧(chat一覧に最新メッセージを表示)
       @talks=[]
      Entry.where(chat_id: myChatIds).where('user_id != ?', @user.id).each do |an|
      Entry.where(chat_id: myChatIds).each do |e|
        if an.chat_id == e.chat_id
          @mutual_chat_id = true
          mutual_ChatIds = an.chat_id
          if @mutual_chat_id = true    
              Entry.where(chat_id: mutual_ChatIds).each do |ee|
                if Talk.where(entry_id: ee.id)
                @talks.push(ee.id)
               end
             end
        end
        end
      end
      end
            
            
          
        
                
               # @mychatids = [[2,"fffffff"],[3,"1234567"],[6,"asfasdf"]]
                 #@mychatids.each do |m| %>
                  #<%= User.find(m[0].name %> 
                  #<%= m[1] %>
                #end
                
                
                
                
                
                
                
    #チャット作成
    @chat = Chat.new
    @entry = @chat.entries.build
    
    @frind = Friend.new
    @friend_following = Friend.where(follower: @user.id).count
    @friend_followers = Friend.where(followed: @user.id).count
    @relationship = "友人レベル"
  end
  
  
  def following
    @user = User.find(params[:id])
    @chat = Chat.new
    @entry = @chat.entries.build
    @friend = Friend.new
    @friend_following = Friend.where(follower: @user.id).count
    @friend_followers = Friend.where(followed: @user.id).count
    @relationship = "友人レベル"
    
    
    @friends =[]
    @request_friends =[]
    @my_friend_of_friends = []
    
    
    Friend.where(follower: current_user.id).each do |f|
    
      if Friend.find_by('follower = ? and followed = ?', f.followed, current_user.id)
      
        @friends.push(f.followed)
    
      else
        @request_friends.push(f.followed)
      end
     end
     
     
     
     
     Friend.where(follower: @user.id).each do |f|
        
        @my_friend_of_friends.push(f.followed)
     
     end
     
     
     
  end
  
  
  
  def followers
    @user = User.find(params[:id])
    @chat = Chat.new
    @entry = @chat.entries.build
    @friend = Friend.new
    @friend_following = Friend.where(follower: @user.id).count
    @friend_followers = Friend.where(followed: @user.id).count
    @relationship = "友人レベル"
    
    
    @friends =[]
    @receive_friends =[]
    @my_friend_followers = []
    
    
    Friend.where(follower: current_user.id).each do |f|
    
      if Friend.find_by('follower = ? and followed = ?', f.followed, current_user.id)
      
        @friends.push(f.followed)
        
      end
     end
   
    Friend.where(followed: current_user.id).each do |f|
    
      if !Friend.find_by('follower = ? and followed = ?', current_user.id, f.follower)
      
      
        @receive_friends.push(f.follower)
    
      end
    end 
    
    
     Friend.where(followed: @user.id).each do |f|
        
        @my_friend_followers.push(f.follower)
     
     end
  end
  
  
  
  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:alert] = '権限はありません'
      redirect_to :back
    end
  end
  
end
