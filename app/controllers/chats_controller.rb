class ChatsController < ApplicationController
     before_action :authenticate_user!, only: [:index, :show,:create, :destroy]
     #before_action :ensure_correct_user, only: [:index,:create, :destroy]
     
    def index
        @entries = Entry.where(user_id: current_user.id).order(created_at: :desc)
        @messages1 = Message.where(chat_id: @entries.chat_id)
    end
    
    def show
        @chat = Chat.find(params[:id])
        #一覧（相手の名前を出す。）
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
       
        
        
    if Entry.where(user_id: current_user.id, chat_id: @chat.id).present?
        #chat用
        @entry = Entry.find_by(chat_id: @chat.id)
        @talks = Talk.where(entry_id: @entry.id)
        @talk = Talk.new
        
    else
        redirect_to :back
        flash[:alert] = '権限はありません'
    end
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
    
    
    
    def edit
        @chat = Chat.find(params{:id})
    end  
        
        
    def update
        @chat.update(params_chat)
        redirect_to @chat
    end
    
    def destroy
        @chat = Chat.find(params[:id])
        @chat.destroy
        redirect_to :back
    end
    
    def ensure_correct_user
     if Entry.where(user_id: current_user.id, chat_id: @chat.id).present?
     else
      flash[:alert] = "権限はありません"
      #redirect_to :back
      redirect_to :back
     end

    end
    
    
    private
    
    def params_chat
       params.require(:chat).permit(name)
        
    end
    
    
    
    def params_entry
        params.require(:entry).permit(:chat_id, :user_id).merge(chat_id: @chat.id)
    end
end
