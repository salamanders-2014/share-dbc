require 'rails_helper'

RSpec.describe LearningStyleResource, :type => :model do
    before(:each) do
      @learning_style_resource = LearningStyleResource.new
    end

	context "A Learning Style Resource join should.." do
	  it { is_expected.to respond_to(:resource) }
    it { is_expected.to respond_to(:learning_style) }
	end
end