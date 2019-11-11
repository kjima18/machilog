class RelationshipsController < ApplicationController
  before_action :authenticate_user, {only: [:create, :destroy]}
  
  def create
    user = User.find_by(id: params[:relationship][:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to user
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to user
    end
  end
  
  def destroy
    user = User.find_by(id: params[:relationship][:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user
    end
  end

end
