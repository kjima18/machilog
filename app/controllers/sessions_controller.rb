class SessionsController < ApplicationController
  before_action :forbit_login_user, {only: [:new, :create]}
  
  def new
  end
  
  def create
    user = User.find_by(email_params)
    if user && user.authenticate(password_params[:password])
      log_in user
      redirect_to posts_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to '/', info: 'ログアウトしました'
  end
  
  private
    def email_params
      params.require(:session).permit(:email)
    end
    
    def password_params
      params.require(:session).permit(:password)
    end
    
  
    def log_in(user)
      session[:user_id] = user.id
    end
    
    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
  
end
