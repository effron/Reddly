class LinksController < ApplicationController
  before_filter :authorize_user, only: [:new, :create, :upvote, :downvote]
  before_filter :already_voted!, only: [:upvote, :downvote]
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      redirect_to @link
    else
      set_flash_errors "Link could not be saved"
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    @comments_by_parent = Comment.comments_by_parent(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      redirect_to @link
    else
      set_flash_errors "Link could not be edited"
      render :edit
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def index
    @links = Link.all.sort_by{ |link| link.score }.reverse
  end

  def upvote
    UserVote.create(
      { link_id: params[:link_id], user_id: current_user.id, vote: 1 } )

    redirect_to :back
  end

  def downvote
    UserVote.create(
      { link_id: params[:link_id], user_id: current_user.id, vote: -1 } )
    redirect_to :back
  end

end