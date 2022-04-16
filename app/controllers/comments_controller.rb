class CommentsController < ApplicationController
  def safe_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id)
  end

  def create
    @comment = Comment.create safe_params.merge(user: current_user)
    if @comment.valid?
      current_user.access_controls.create(access_controlled: @comment)
      flash[:success] = t("comment.created")
    else
      flash[:warning] = @comment.errors.full_messages
    end
    redirect_to @comment.commentable
  end
end
