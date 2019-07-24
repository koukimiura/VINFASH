# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    #before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]
   protect_from_forgery #追記
   
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
    #@user = User.find(params[:id])
    @areas = Area.all
    @area = Area.new
    @user = User.new
    #my_shoe
    @user.my_shoes.build
    @shoes = Shoe.all
    #my_consumption
    @consumptions = Consumption.all
    @user.my_consumptions.build
     super
   end
   

  # PUT /resource
   def update
    super
    
   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected
   

  # If you have extra params to permit, append them to the sanitizer.
    #def configure_sign_up_params
   #   devise_parameter_sanitizer.permit(:sign_up,    #子モデルをユーザー登録時にいっしょにテーブルへデータを作る
   #   keys:  [:name, :gender, :birthday, :adress, :image, :my_size, :my_shoes_size,
   #   :my_height, :genre, :my_price, :self_introduction, :attribute ])
    #end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update,
     keys: [:name, :gender, :birthday, :adress, :image, :my_size,
     :my_height, :genre, :self_introduction,
     :my_shoes_attributes => [:id, :shoe_id, :user_id],
     :my_consumptions_attributes => [:id, :consumption_id, :user_id]])
     logger.debug("my_shoes_attributes => #{params[:user][:my_shoes_attributes]}")
  end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
   edit_user_registration_path
   end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
