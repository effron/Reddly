class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    @comments_by_parent = @comment.comments_by_parent
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      set_flash_errors "Could not save comment"
      redirect_to link_url
    end
  end


end