require 'rails_helper'

describe Subject do
	before(:each) do
      @subject = Subject.new(name: "jQuery")
    end
	it "saves a valid subject" do
      expect(@subject.save).to eq(true)		
	end
	it { should respond_to(:resources) }
	describe "invalid name" do
		before {@subject.name = ""}
		it "should not save a subject without a title" do
			expect(@subject.save).to eq(false)	
		end
	end 
	describe "subject name less than 2 letters" do
		before {@subject.name = "t"}
		it "should not save a subject < 2 letters long" do
			expect(@subject.save).to eq(false)	
		end
	end
end 