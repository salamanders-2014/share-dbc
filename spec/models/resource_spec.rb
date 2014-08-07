require 'rails_helper'

RSpec.describe Resource, :type => :model do

  context "A Resource should.." do
    it { should ensure_length_of(:link).is_at_least(6) }
    it 'should strip http:// from link' do
      @resource = Resource.create(title: 'rspec', link: 'http://www.google.com')
      expect(@resource.link).to eq 'www.google.com'
    end
    it { should ensure_length_of(:title).is_at_least(4) }
    it { should have_many(:comments)}
  end
end
