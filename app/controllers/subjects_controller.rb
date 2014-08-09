class SubjectsController < ActionController::Base
  # def new
  #   @subject = Subject.new
  #   render 'new'
  # end


  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
    render 'show', layout: "application"
  end
end
