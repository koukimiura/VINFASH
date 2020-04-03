class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
     def forbid_login_user
         if current_user.email != nil &&current_user.name == nil || current_user.gender == nil || current_user.birthday == nil ||
            current_user.adress == nil || current_user.my_size == nil || current_user.my_height == nil || current_user.genre == nil || 
            current_user.self_introduction == nil
                 redirect_to edit_user_registration_path
                 flash[:alert] ='ユーザー詳細を入力してください。'
         end
     end
     
     def sign_in_and_redirect(resource_or_scope, *args)
          #可変長引数(args)配列からハッシュと取り出す。
          options  = args.extract_options!
          scope    = Devise::Mapping.find_scope!(resource_or_scope)
          resource = args.last || resource_or_scope
          sign_in(scope, resource, options)
          # redirect_to after_sign_in_path_for(resource)
          redirect_to edit_user_registration_path(resource)
     end
  
  
  def sns_registration_and_redirect(resource_or_scope, *args)
      options  = args.extract_options!
      scope    = Devise::Mapping.find_scope!(resource_or_scope)
      resource = args.last || resource_or_scope
      sign_in(scope, resource, options)
      redirect_to user_path(resource)
  end
end

