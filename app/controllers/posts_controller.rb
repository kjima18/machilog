class PostsController < ApplicationController
  before_action :post_authenticate_user, only: [:edit, :update, :destroy]
  
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(5).order(created_at: :desc).includes(:like_users)
    if @posts.empty?
      flash.now[:danger] = "投稿が見つかりません" 
    end
  end
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  #都道府県から市町村の絞り込みAjax処理
  def get_cities
    render partial: 'cities', locals: { prefecture_id: params[:prefecture_id]}
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, success: '投稿しました'
    else
      flash.now[:danger] = "投稿できませんでした"   
      render :new
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to posts_path, success: '変更を保存しました'
    else
      flash.now[:danger] = "保存できませんでした"   
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.user_id == current_user.id
      if @post.destroy
        redirect_to posts_path, success: "投稿を削除しました"
      else
        flash.now[:danger] = "削除できませんでした" 
        render :index
      end
    else
      flash.now[:danger] = "別ユーザーの投稿は削除できません" 
      render :index
    end
  end
  
  def post_authenticate_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != current_user.id
      redirect_to posts_path, danger: "別ユーザーの投稿は編集できません"
    end
  end
  
  private
   def post_params
     params.require(:post).permit(:content, :image, :prefecture_id, :city_id)
   end
   
   
  
end
