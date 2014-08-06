class UsersController < ActionController::Base
  def new
    @user = User.new
  end

  def login
    @user = User.new
  end

  def show

  end

end
