require 'rails_helper'

describe UsersController do

  describe "#create" do
    it "should save the user to the db if the form is valid" do
      post :create, user: { first_name: "User", last_name: "Test", email: "user@test.com", cohort: "salamanders", username: "testuser", password: "password"}
      expect(response).to redirect_to User.find_by(first_name: "User", last_name: "Test", email: "user@test.com", cohort: "salamanders", username: "testuser")
    end

    it "does not save the user to the db if the form is invalid" do
      post :create, user: { first_name: "", last_name: "Test", email: "user@test.com", cohort: "salamanders", username: "testuser", password: "password"}
      expect(response).to render_template :new
    end
  end
end
