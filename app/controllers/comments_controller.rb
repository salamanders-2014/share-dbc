class CommentsController < ApplicationController
  #I deleted all get methods from comments since I think it would be better if new & edit forms were inside each resource's page.
  #Leading to a separate page just to make a comment on a resource seemed unnecessary when we can just render a comment partial form inside the resource page.
  def create
    current_user
    @resource = Resource.find(params[:resource_id])
    @comment = @resource.comments.create(user_id: current_user.id, text: params[:comment][:text])
    redirect_to resource_path(@resource)
  end

  def update
    @resource = Resource.find(params[:resource_id])
    @comment = @resource.comments.find(params[:id])
    if current_user == @comment.user
      @comment.update(comment_params)
      redirect_to resource_path(@resource)
    else
      redirect_to(:back)
    end
  end

  def destroy
    @resource = Resource.find(params[:resource_id])
    @comment = @resource.comments.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      redirect_to resource_path(@resource)
    else
      redirect_to(:back)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end


end

#     resource_comments POST   /resources/:resource_id/comments(.:format)          comments#create
#  new_resource_comment GET    /resources/:resource_id/comments/new(.:format)      comments#new
# edit_resource_comment GET    /resources/:resource_id/comments/:id/edit(.:format) comments#edit
#      resource_comment GET    /resources/:resource_id/comments/:id(.:format)      comments#show
#                       PATCH  /resources/:resource_id/comments/:id(.:format)      comments#update
#                       PUT    /resources/:resource_id/comments/:id(.:format)      comments#update
#                       DELETE /resources/:resource_id/comments/:id(.:format)      comments#destroy