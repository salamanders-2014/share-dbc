class ResourcesController < ApplicationController

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect to @resource
    else
      render 'new'
    end

  end

  def show
    @resource = Resource.find(params[:id])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update(resource_params)
      redirect_to @resource
    else
      render 'edit'
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    redirect_to user_path(@user)
  end

  private
    def resource_params
      params.require(:resource).permit(:title, :link, :description)
    end

end
