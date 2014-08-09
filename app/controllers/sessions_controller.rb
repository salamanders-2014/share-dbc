class SessionsController < ActionController::Base
  def new
    render 'new', layout: "application"
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      @errors = true
      render 'new', layout: "application"
    end
  end

  def destroy
    session.clear
    redirect_to :root
  end

end
