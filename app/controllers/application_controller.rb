class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
 def forbid_login_user
     
     if current_user.email != nil &&current_user.name == nil || current_user.gender == nil || current_user.birthday == nil ||
        current_user.adress == nil || current_user.my_size == nil || current_user.my_height == nil || current_user.genre == nil || 
        current_user.self_introduction == nil
         
         flash[:alert] ='ユーザー詳細を入力してください。'
         redirect_to edit_user_registration_path
         
     end
     
 end
end

