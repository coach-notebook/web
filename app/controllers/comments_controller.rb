class CommentsController < ApplicationController
  before_action :ensure_enabled

  def safe_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id)
  end

  def create
    @comment = Comment.create safe_params.merge(user: current_user)
    if @comment.valid?
      current_user.access_controls.create(access_controlled: @comment)
      flash[:success] = t("comment.create.success")
    else
      flash[:warning] = @comment.errors.full_messages
    end
    redirect_to @comment.commentable
  end

  protected

  def ensure_enabled
    render :not_found unless Flipper.enabled?(:comments, current_user)
  end
end
