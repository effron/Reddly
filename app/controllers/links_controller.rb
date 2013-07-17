class LinksController < ApplicationController
  before_filter :authorize_user, only: [:new, :create]

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
end