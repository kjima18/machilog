class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to posts_path, success: 'コメントしました'
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end

  def destroy
    @comment = Comment.find_by(post_id: params[:post_id])
    if @comment.destroy
      redirect_to posts_path, success: 'コメントを削除しました'
    else
      flash.now[:danger] = "コメントを削除できませんでした"
      render :index
    end
  end
  
  
  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
