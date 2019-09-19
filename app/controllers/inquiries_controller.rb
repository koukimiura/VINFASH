class InquiriesController < ApplicationController
    
    
    def index
        @inquiries = Inquiry.all
    end
    
    
    def new
        @inquiry= Inquiry.new
        
    end
    
    def create
        @inquiry = Inquiry.new(inquiry_params)
            if @inquiry.save
                InquiryMailer.send_when_create(@inquiry).deliver
                redirect_to root_path 
                flash[:notice] = 'お問合わせ内容を送信しました。'
            else
                render 'new'
                flash[:alert] = 'お問合わせ内容を送信できません。'
            end
    end
    
    
    
    private
    
    def inquiry_params
        params.require(:inquiry).permit(:name, :email, :content)
    end
    
    
    
end
