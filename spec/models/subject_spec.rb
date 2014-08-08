require 'rails_helper'

describe Subject do
	before(:each) do
      @subject = Subject.new(name: "jQuery")
    end
	it "saves a valid subject" do
      expect(@subject.save).to eq(true)		
	end
	it { should respond_to(:resources) }
end 