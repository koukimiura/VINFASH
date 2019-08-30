class MyAreasController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy]
    before_action :forbid_login_user
    
     def new
        @my_area = MyArea.new
        @areas = Area.all
        
        @chosen_areas = []
    
        MyArea.where(user_id: current_user.id).each do |my|
            if Area.find(my.area_id)
                @chosen_areas.push(my.area_id)
            end
        end
     end
     
     
     
     def create
         @my_area = MyArea.create(my_area_params)
          @my_area.save
         flash[:notice] = 'エリアを登録しました'
         redirect_to :back
             
     end
    
     def destroy
         @my_area = MyArea.find_by(area_id: params[:id])
         @my_area.destroy
         redirect_to :back
     end
    
    private
    def my_area_params
        params.require(:my_area).permit(:area_id, :user_id).merge(:user_id => current_user.id)
    end
    
end
