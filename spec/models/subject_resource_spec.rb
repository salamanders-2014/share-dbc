require 'rails_helper'

RSpec.describe SubjectResource, :type => :model do
    before(:each) do
      @subject_resource = SubjectResource.new
    end

	context "A SubjectResource join should.." do
	  it { is_expected.to respond_to(:resource) }
    it { is_expected.to respond_to(:subject) }
	end
end