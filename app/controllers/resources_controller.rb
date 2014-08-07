class ResourcesController < ApplicationController

  def new
    @resource = Resource.new
  end

  def create
    @user = User.find(session[:user_id])
    @resource = @user.resources.create(resource_params)
    if @resource.save
      redirect_to @resource
    else
      render 'new'
    end
  end

  def show
    @creator = User.find(@resource.creator.id)
    @resource = Resource.find(params[:id])
  end

  def edit
    @creator = User.find(@resource.creator.id)
    @resource = Resource.find(params[:id])
  end

  def update
    @creator = User.find(@resource.creator.id)
    @resource = Resource.find(params[:id])
    if @resource.update(resource_params)
      redirect_to @resource
    else
      render 'edit'
    end
  end

  def destroy
    @creator = User.find(@resource.creator.id)
    @resource = Resource.find(params[:id])
    @resource.destroy

    redirect_to user_path(@user)
  end

  def upvote
    @resource = Resource.find(params[:id])
    @learning_style = @resource.learning_style.find(params[:learning_style])
    @voter = User.find(session[:user_id])
    @resource.votes.create(voter_id:@voter.id, value: 1)
  end

  # def downvote
  #   @resource = Resource.find(params[:id])
  #   @voter = User.find(session[:user_id])
  #   @resource.votes.create(voter_id:@voter.id, value: -1)
  # end

  private
    def resource_params
      params.require(:resource).permit(:title, :link, :description)
    end

end
