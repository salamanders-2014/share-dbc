require 'rails_helper'

RSpec.describe Vote, :type => :model do
    before(:each) do
      @vote = Vote.new(value: 1)
    end
  pending "add some examples to (or delete) #{__FILE__}"
	context "A Vote should.." do
	  it { should respond_to(:resource) }
    it { should respond_to(:learning_style) }
    it { should respond_to(:voter) }
	end

  context "users can only vote once" do
    before {@vote = Vote.create(voter_id: 1, resource_id: 1, learning_style_id: 1, value: 1)}
    it {is_expected.to be_valid}
    it "should not allow a voter to vote with the same value for a learning_style more than once" do
      @cheater = Vote.create(voter_id: 1, resource_id: 1, learning_style_id: 1, value: 1)
      expect(@cheater).to be_valid
    end
  end
end
