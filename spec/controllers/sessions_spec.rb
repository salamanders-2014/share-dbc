require 'rails_helper'

describe SessionsController do
  describe "create" do
    before(:each) do
      @user = User.create!(first_name: "User", last_name: "Test", email: "user@test.com", cohort: "salamanders", username: "testuser", password: "password")
    end

    it "authenticates the user with correct credentials" do
      post :create, session: { username: @user.username, password: @user.password }
      expect(response).to redirect_to @user
      expect(session[:user_id]).to be(@user.id)
    end

    it "does not authenticate the user with incorrect credentials" do
      post :create, session: { username: @user.username, password: ''}
      expect(response).to render_template(:new)
      expect(session[:user_id]).to be_nil
    end
  end
end
