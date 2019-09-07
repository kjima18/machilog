class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.page(params[:page]).per(2).order(created_at: :desc)
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
  
  private 
   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end
