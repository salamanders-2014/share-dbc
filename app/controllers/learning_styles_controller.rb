class LearningStylesController < ActionController::Base
  def index
    render 'index', layout: "application"
  end

  def show
    puts params
    @learning_style = LearningStyle.find(params[:id])
    @resources = @learning_style.resources
    Resource.all.each do |r|
      if r.votes.where(:learning_style_id => @learning_style.id).sum(:value) >= 5
        @resources << r
      end
    end
    @resources.uniq!.each do |r|
      if r.votes.where(:learning_style_id => @learning_style.id).sum(:value) <= -5
        @resources.delete(r)
      end
    end
    render 'show', layout: "application"
  end
end