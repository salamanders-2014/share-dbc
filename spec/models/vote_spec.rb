require 'rails_helper'

RSpec.describe Vote, :type => :model do
    before(:each) do
      @vote = Vote.new(value: 1)
    end	
  pending "add some examples to (or delete) #{__FILE__}"
	context "A Vote should.." do  
	  it { should respond_to(:resources) }
	end
end