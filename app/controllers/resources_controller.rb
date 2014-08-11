class ResourcesController < ApplicationController

  def new
    @resource = Resource.new
    @subjects ||= Subject.order(:name)
  end

  def create
    @creator = User.find_by(id: current_user)
    @resource = @creator.resources.new(resource_params)
    if @resource.save
      if params[:resource]["learning_style_ids"] != nil
        params[:resource]["learning_style_ids"].each do |x|
          if x != ""
            LearningStyleResource.create(resource_id: @resource.id, learning_style_id: x)
          end
        end
      else
        LearningStyleResource.create(resource_id: @resource.id, learning_style_id: 1)
      end
      params[:resource]["subjects"].each do |x|
        if x != ""
          SubjectResource.create(subject_id: x, resource_id: @resource.id)
        end
      end
      redirect_to @resource
    else
      @subjects ||= Subject.order(:name)
      render :new
    end
  end

  def show
    @user = current_user
    @resource = Resource.find(params[:id])
    @creator = @resource.creator
    @votes = @resource.votes
    @vote_array =[{type: "Visual", value: ""},{type: "Auditory", value: ""},{type: "Read/Write", value: ""},{type: "Kinesthetic", value: ""}]
    (1..4).each do |v|
      @vote_array[v-1][:value] = @votes.where(learning_style_id: v).sum(:value)
    end

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
    @resource = Resource.find(params[:resource_id])
    @this_vote = @resource.votes.where(voter_id: current_user.id, learning_style_id: params[:learning_style_id]).first

    if current_user.id != @resource.creator.id
      if @this_vote && @this_vote.value === -1
        @this_vote.destroy
        new_vote(0)
      elsif @this_vote && @this_vote.value === 0
        @this_vote.destroy
        new_vote(1)
      else
        new_vote(1)
      end
    end
    redirect_to @resource
  end

  def downvote
    @resource = Resource.find(params[:resource_id])
    @this_vote = @resource.votes.where(voter_id: current_user.id, learning_style_id: params[:learning_style_id]).first

    if current_user.id != @resource.creator.id
      if @this_vote && @this_vote.value === 1
        @this_vote.destroy
        new_vote(0)
      elsif @this_vote && @this_vote.value === 0
        @this_vote.destroy
        new_vote(-1)
      else
        new_vote(-1)
      end
    end
    redirect_to @resource
  end

  private
    def resource_params
      params.require(:resource).permit(:title, :link, :description, "learning_style_ids", :subjects)
    end

    def new_vote(val)
      @resource.votes.create(voter_id: current_user.id, learning_style_id: params[:learning_style_id], value: val)
    end


end
