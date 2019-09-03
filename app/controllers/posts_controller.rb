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
  
  def show
  end
  
  def edit
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      redirect_to posts_path, success: "投稿を削除しました"
    else
      flash.now[:danger] = "削除できませんでした" 
      render :index
    end
  end  
  
  private
   def post_params
     params.require(:post).permit(:content, :image)
   end
  
end
