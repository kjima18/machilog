class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def authenticate_user
    if current_user == nil
      flash[:warning] = "ログインが必要です"
      redirect_to login_path
    end
  end
  
  def forbit_login_user
    if current_user
      flash[:warning] = "すでにログインしています"
      redirect_to posts_path
    end
  end

  helper_method :current_user, :logged_in?
end
