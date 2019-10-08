class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update, :destroy]}
  before_action :forbit_login_user, {only: [:new, :create]}
  before_action :admin_user       , {only: :destroy}
  
  def index
    @users = User.all
    @users = User.page(params[:page]).per(5).order(created_at: :desc)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/', success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def likes
    @user = User.find_by(id: params[:id])
  end
  
  def follow
    @user = User.find_by(id: params[:id])
  end
  
  def follower
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_edit_params)
      redirect_to user_path, success: '変更を保存しました'
    else
      flash.now[:danger] = "変更できませんでした"   
      render :edit
    end
  end
  
  def destroy
    if User.find_by(id: params[:id]).destroy
      redirect_to users_path, success: "削除しました"
    else
      flash.now[:danger] = "削除できませんでした" 
      render :index
    end
  end
  
  private 
   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
   
   def user_edit_params
     params.require(:user).permit(:name, :email, :image)
   end
end
