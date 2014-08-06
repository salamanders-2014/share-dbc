class SessionsController < ActionController::Base
  def new
    @user = User.find_by(username: params[:username])
  end

  def create
    @user = User.find_or_create_by(username: params[:username])
    session[:id] = @user.id

    render :new
  end

end
