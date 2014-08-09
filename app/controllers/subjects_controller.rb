class SubjectsController < ActionController::Base
  # def new
  #   @subject = Subject.new
  #   render 'new'
  # end


  def index
    @subjects = Subject.all
    render 'index', layout: "application"
  end

  def show
    @subject = Subject.find(params[:id])
    render 'show', layout: "application"
  end
end
