require 'rails_helper'

RSpec.describe ResourcesController, :type => :controller do
  describe "#create" do
    before do @current_user = User.create!(first_name: "User", last_name: "Test", email: "user@test.com", cohort: "salamanders", username: "testuser", password: "password")
      session[:user_id]=@current_user.id
    end
    it "should redirect to that resource on successful save" do
      post :create, resource: {title: "RSpec", link: "https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/respond-to-matcher", description: "How to test respond-to-matcher", "subjects"=>["5", "2", ""], "learning_style_ids"=>["13", "14"] }
      expect(response).to redirect_to resource_path(Resource.find_by(title: "RSpec"))
    end
  end
end
