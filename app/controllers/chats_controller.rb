class ChatsController < ApplicationController
     before_action :authenticate_user!, only: [:show, :create]
     before_action :forbid_login_user
    
    def show
        @chat = Chat.find(params[:id])
        #正しいユーザーかどうか
        if Entry.where(user_id: current_user.id, chat_id: @chat.id).present?
            #chat用
            @entries_for_talk = Entry.where(chat_id: @chat.id)
            @entries3 = Entry.where(chat_id: @chat.id)
            @entry = Entry.find_by(chat_id: @chat.id)
            
            @talks_message = []
  
           # @entries3.each do |entry|
                if Talk.where(entry_id: @entries3).present?
                       Talk.where(entry_id: @entries3).each do |t|
                          @talks_message.push(t)  
                        end
                    #logger.debug("--------@talks_message = #{@talks_message}")
                    #logger.debug("--------------#{@talks_message.inspect}")
                end
        
            
           
            
            @talk = Talk.new
        else
            redirect_to :back
            flash[:alert] = '権限はありません'
        end
        
    #一覧（メッセージ一覧。）
        #each文配列をmyRoomIds代入
        myChatIds = []
        #current_userのレコードを取得
        #current_userのレコードchat_idと同じchat.idを取得
            Entry.where(user_id: current_user.id).each do |e|
                if Chat.find(e.chat_id)
                    myChatIds.push(e.chat_id)
                end
            end
       #current_user.chat_idと同じchat_idを探してuser.id != current_user_idとする
        @anotherEntries = Entry.where(chat_id: myChatIds).where('user_id != ?', current_user.id)
        #user参加��チャット相手がわかる
        @myentries = Entry.where(chat_id: myChatIds).where(user_id: current_user.id)
    
        #talk一覧(chat一覧に最新メッセージを表示)
        #@talk_userIds=[]
        @talks=[] 
            @anotherEntries.each do |an|
                @myentries.each do |e| 
                    if an.chat_id == e.chat_id  #同じentry.idが複数入ってしまう。
                        @talks.push(Talk.order(created_at: :desc)
                              .where(entry_id: [an.id, e.id]).first)
                    end
                end 
            end 
            
        #順番揃える
        talks2=[]
            @talks_all = Talk.all.order(created_at: :desc)
                @talks_all.each do |talk_all|
                    @talks.each do |talk|
                        if talk_all.id == talk.id
                            talks2.push(talk.id)
                        end
                    end
                end
        
        @talks3 = talks2.map do |t|
            Talk.find(t)
        end
            
            
        @notifications = Notification.where(visited_id: current_user.id)
                                     .where(action: "T")
                                     .order(created_at: :desc)
    end
    
    
    def create
        @chat = Chat.create
        # @chat.idができて、@entry作成に使用する。
        @entry1 = Entry.create(chat_id: @chat.id, user_id: current_user.id)
        #上記はusers/showのsubmitボタンを押したcurrent_user用
        @entry2 = Entry.create(params_entry)
        #上記はusers/showのsubmitボタンを押されたuser用
            flash[:notice] = 'チャットボックスを作成しました。'
            redirect_to @chat
    end
    
    
    private
    
    def params_entry
        params.require(:entry).permit(:chat_id, :user_id).merge(chat_id: @chat.id)
    end
end
