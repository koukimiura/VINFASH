class PostsController < ApplicationController
    def index
        
        @posts =  Post.all.order(created_at: :desc)
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new

    end
    
    def create
         @post= Post.new(post_params)
         if @post.save
            flash[:notice] = '投稿しました。'
            redirect_to @post
         else
            flash[:alert] = '投稿できませんでした。'
            render 'posts/new'
         end
    end
    
    def edit
         @post = Post.find(params[:id])
    end
    
    def update
         @post = Post.find(params[:id])
          @post.update(post_params)
         if @post.save
            flash[:notice] = '投稿を編集しました。'
            redirect_to @post
         else
            flash[:alert] = '投稿編集できませんでした。'
            render 'posts/edit'
         end
        
    end
    
    def destroy
         @post = Post.find(params[:id])
         @post.destroy
         redirect_to posts_path
    end
    
    
    private 
    def post_params
        params.require(:post).permit(:title, :content, :image).merge(:user_id => current_user.id)
    end
end
