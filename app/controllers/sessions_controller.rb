class SessionsController < ActionController::Base
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      puts 'Invalid email/password combination'
      render 'new'
    end
  end

end
