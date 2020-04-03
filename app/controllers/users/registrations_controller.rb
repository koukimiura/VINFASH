# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   #before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]
   protect_from_forgery #追記
   before_action :shoeAll, only: [:edit, :update]
   before_action :consumptionAll, only: [:edit, :update]
   
  # GET /resource/sign_up
   # def new
   #   super
   # end

  # POST /resource
   #def create
   
    #super
   #end

  # GET /resource/edit
   def edit
     super
   end
   

  # PUT /resource
   def update
     super
     
   end

  # DELETE /resource
   # def destroy
   #   super
   # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected
  
   def shoeAll
     @shoes = Shoe.all
   end
   
   def consumptionAll
     @consumptions = Consumption.all
   end
   
   private
  # If you have extra params to permit, append them to the sanitizer.
   # def configure_sign_up_params
   #   devise_parameter_sanitizer.permit(:sign_up,    #子モデルをユーザー登録時にいっしょにテーブルへデータを作る
   #   keys:  [:name, :gender, :birthday, :adress, :image, :my_size, :my_shoes_size,
   #   :my_height, :genre, :my_price, :self_introduction, :attribute ])
   # end


  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update,
     keys: [:name, :gender, :birthday, :adress, :image, :my_size,
     :my_height, :genre, :self_introduction, :shoe_id, :consumption_id]) 
  end
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  #  The path used after sign up.
 def after_sign_up_path_for(resource)
     edit_user_registration_path(resource)
 end
    
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
end

