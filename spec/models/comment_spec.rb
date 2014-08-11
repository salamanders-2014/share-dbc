require 'rails_helper'

RSpec.describe Comment, :type => :model do
    before(:each) do
      @comment = Comment.new(text: "Urban, progressive change-makers, experience in the field Global South revitalize replicable. Long-term political change lives inspire social change contribution. Country community health workers care, public service international development fairness.")
    end

	context "A Comment should.." do
	  it { is_expected.to respond_to(:resource) }
    it { is_expected.to respond_to(:user) }
	end

  context "should not be valid if it doesn't include a comment body" do
    before { @comment.text="" }
    it { is_expected.to_not be_valid }
  end
end