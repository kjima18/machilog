class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user_id = current_user.id
    @like.post_id = params[:post_id]
    if @like.save
      redirect_to posts_path, success: 'いいねしました'
    else
      redirect_to posts_path, danger: 'いいねに失敗しました'
    end
  end
  
  def destroy
    @like = Like.find_by(user_id: current_user.id, topic_id: params[:post_id])
    @like.destroy if @like.present?
    if @like.destroyed?
      redirect_to posts_path, success: 'いいねを取り消しました'
    else
      redirect_to posts_path, success: 'いいねを取り消しできませんでした'
    end
  end
    
end
