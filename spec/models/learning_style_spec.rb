require 'rails_helper'

RSpec.describe LearningStyle, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "A LearningStyle should ..." do
    it {should respond_to :learning_style_resources}
    it {should respond_to :resources}
  end

  describe "valid LearningStyle form" do
    before { @audio = LearningStyle.create(name: "audio")}
    it "should be valid when name is present" do
      expect(@audio).to be_valid
    end
    it "should not be valid if a name is not present" do
      @audio.name = ""
      expect(@audio).to_not be_valid
    end
  end
end
