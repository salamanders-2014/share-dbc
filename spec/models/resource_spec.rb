require 'rails_helper'

RSpec.describe Resource, :type => :model do

  context "A Resource should.." do
    it { should ensure_length_of(:link).is_at_least(6) }
    it { should respond_to(:http_stripper)}
    it 'should have a method http_stripper thats strips http:// from link' do
      @resource = Resource.create(title: 'rspec', link: 'http://www.google.com')
      expect(@resource.link).to eq 'www.google.com'
    end
    it { should ensure_length_of(:title).is_at_least(4) }
    it { should respond_to(:comments)}
    it { should respond_to(:votes)}
    it { should respond_to(:learning_style_resources)}
    it { should respond_to(:learning_styles)}
    it { should respond_to(:subjects)}
  end
  describe "invalid Resource" do
    before(:each) do
      @resource = Resource.new(title: "jQuery takes over", link: "http://www.google.com", description: "something")
    end
    describe "should not be valid if it doesn't include a title" do
			before { @resource.title="" }
			it { is_expected.to_not be_valid }
		end
    describe "should not be valid if it doesn't include a link" do
			before { @resource.link="" }
			it { is_expected.to_not be_valid }
		end
	end
end
