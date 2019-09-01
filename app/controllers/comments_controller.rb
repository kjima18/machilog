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
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
