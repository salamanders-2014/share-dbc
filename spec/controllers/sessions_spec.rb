require 'rails_helper'

describe SessionsController do
  # it { should have_selector('div.alert.alert-error')}
  describe "create" do
    before(:each) {@user = User.create!(first_name: "User", last_name: "Test", email: "user@test.com", cohort: "salamanders", username: "testuser", password: "password") }
    it "authenticates the user with correct credentials" do
      post :create, session: { username: @user.username, password: @user.password }
      expect(response).to redirect_to @user
    end
    it "sets the session with correct credentials" do
      post :create, session: { username: @user.username, password: @user.password }
      expect(session[:user_id]).to be(@user.id)
    end

    it "does not authenticate the user with incorrect credentials" do
      post :create, session: { username: @user.username, password: ''}
      expect(response).to render_template(:new)
    end

    it "does not set the session with incorrect credentials" do
      post :create, session: { username: @user.username, password: "" }
      expect(session[:user_id]).to be_nil
    end
  end
end
