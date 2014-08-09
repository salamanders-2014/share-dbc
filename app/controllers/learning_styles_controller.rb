class LearningStylesController < ActionController::Base
  def index
    render 'index', layout: "application"
  end

  def show
    puts params
    @learning_style = LearningStyle.find_by(id: params[:id])
    render 'show', layout: "application"
  end
end