class LearningStylesController < ActionController::Base
  def index
    render 'index', layout: "application"
  end

  def show
    puts params
    @learning_style = LearningStyle.find(params[:id])
    @resources = @learning_style.resources
    render 'show', layout: "application"
  end
end