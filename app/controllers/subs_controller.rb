class SubsController < ApplicationController
  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(params[:sub])
    if @sub.save
      redirect_to @sub
    else
      set_flash_errors "Could not save sub"
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(params[:sub])
      redirect_to @sub
    else
      set_flash_errors "Could not update sub"
      render :edit
    end
  end
end