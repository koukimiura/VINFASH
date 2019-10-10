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
                @talk = Talk.new
                #通知F => T
                @notifications = Notification.where(visited_id: current_user.id)
                                     .where(action: "T")
                                     .order(created_at: :desc)
                                     
                @talks_message = []
                    if Talk.where(entry_id: @entries3).present?
                           Talk.where(entry_id: @entries3).each do |t|
                              @talks_message.push(t)  
                            end
                        #logger.debug("--------@talks_message = #{@talks_message}")
                        #logger.debug("--------------#{@talks_message.inspect}")
                    end
                
                #チャット一覧（最新メッセージ）
                #each文配列をmyChatIds代入
                #current_userの参加しているレコードを取得
                myChatIds = []
                    Entry.where(user_id: current_user.id).each do |e|
                        if Chat.find(e.chat_id)
                            myChatIds.push(e.chat_id)
                           # logger.debug("--------myEntries=#{myEntries}")
                        end
                    end
                    
                #view用
                @anotherEntries = Entry.where(chat_id: myChatIds).where('user_id != ?', current_user.id)
                #current_user.chat_idと同じchat_idを探してuser.id != current_user_idとする
                anotherEntries = Entry.where(chat_id: myChatIds).where('user_id != ?', current_user.id)
                #logger.debug("--------------anotherEntries=#{anotherEntries.inspect}")
                #自分のuser_idと参加しているchat_id
                myEntries = Entry.where(chat_id: myChatIds).where(user_id: current_user.id)
                #logger.debug("--------------myEntries=#{myEntries.inspect}")
                #チャットの最新のTalkレコードを取得
                talks=[] 
                    anotherEntries.each do |an|
                        myEntries.each do |e| 
                            if an.chat_id == e.chat_id #同じentry.idが複数入ってしまう。
                                talks.push(Talk.order(created_at: :desc)
                                      .where(entry_id: [an.id, e.id]).first)
                            end
                        end 
                    end 
                
                #ChatレコードEntryレコードがcreateされたがTalkがされていないのtalksにはnilがある可能性があるcompackメソッドで弾く
                new_talks = talks.compact
                #logger.debug("--------------new_talks=#{new_talks.inspect}")
                    
                talks_all = Talk.all.order(created_at: :desc)
                #順番揃える
                talks2=[]
                    talks_all.each do |talk_all|
                        new_talks.each do |talk|
                            if talk_all.id == talk.id
                                talks2.push(talk.id)
                            end
                        end
                    end
                
                #最終的配列 for view
                @talks3 = talks2.map do |t|
                    Talk.find(t)
                end
            
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
    
    
    private
    
    def params_entry
        params.require(:entry).permit(:chat_id, :user_id).merge(chat_id: @chat.id)
    end
end
