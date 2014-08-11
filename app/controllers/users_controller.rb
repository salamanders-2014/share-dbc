class UsersController < ActionController::Base
  def new
    @user = User.new
    render 'new', layout: "application"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(:back)
    else
      render 'new', layout: "application"
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show', layout: "application"
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username,
        :email, :cohort, :password)
    end
end
