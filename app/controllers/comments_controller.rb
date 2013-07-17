class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    @comments_by_parent = @comment.comments_by_parent
  end

  def create
    current_user.comments.build(params[:comment])
    if current_user.save
      redirect_to :back
    else
      set_flash_errors "Could not save comment"
      redirect_to :back
    end
  end


end