class ResourcesController < ApplicationController

  def new
    @resource = Resource.new
  end

  def create
    @creator = current_user
    @resource = @creator.resources.new(resource_params)

    if @resource.save
      params[:resource]["learning_style_ids"].each do |x|
        LearningStyleResource.create(resource_id: @resource.id, learning_style_id: x)
      end
      redirect_to @resource
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @resource = Resource.find(params[:id])
    @creator = @resource.creator
  end

  def edit
    @resource = Resource.find(params[:id])
    @creator = User.find(@resource.creator_id)
  end

  def update
    @creator = @resource.creator
    @resource = Resource.find(params[:id])
    if @resource.update(resource_params)
      redirect_to @resource
    else
      render 'edit'
    end
  end

  def destroy
    @resource = Resource.find_by(creator_id: session[:user_id], id: params[:id])
    @resource.destroy

    redirect_to user_path(session[:user_id])
  end

  def upvote
    @resource = Resource.find(params[:id])
    @learning_style = @resource.learning_style.find(params[:learning_style])

    @resource.votes.create(voter_id:@voter.id, value: 1)
  end

  # def downvote
  #   @resource = Resource.find(params[:id])
  #   @voter = User.find(session[:user_id])
  #   @resource.votes.create(voter_id:@voter.id, value: -1)
  # end

  private
    def resource_params
      params.require(:resource).permit(:title, :link, :description, "learning_style_ids")
    end

end
