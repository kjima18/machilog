class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, success: '自慢しました'
    else
      flash.now[:danger] = "自慢できませんでした"   
      render :new
    end
  end
  
  def update
  end
  
  def destroy
  end  
  
  private
   def post_params
     params.require(:post).permit(:content, :image)
   end
  
end
