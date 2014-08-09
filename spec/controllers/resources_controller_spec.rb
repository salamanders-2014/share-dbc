require 'rails_helper'

RSpec.describe ResourcesController, :type => :controller do
  describe "create" do
    it "should save the resource to the db if the form is valid" do
      post :create, resource: {title: "RSpec", link: "https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/respond-to-matcher", description: "How to test respond-to-matcher" }
      expect(response).to redirect_to Resource.find_by(title: "RSpec", link: "https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/respond-to-matcher", description: "How to test respond-to-matcher")
    end
  end
end
