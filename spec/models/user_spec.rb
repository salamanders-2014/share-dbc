require 'rails_helper'

describe User do
  context "valid signin" do
    before(:each) do
      @user = User.new(first_name: "User", last_name: "Test", email: "user@test.com", cohort: "salamanders", username: "testuser", password: "password")
    end
    it "saves a valid sigin form" do
      expect(@user.save).to eq(true)
    end
  end
  context "invalid signup" do
    before(:each) do
      @user = User.new(first_name: "", last_name: "Test", email: "user@test.com", cohort: "salamanders", username: "testuser", password: "password")
    end
    it "does not save an invalid signin form" do
      expect(@user.save).to eq(false)
    end
    it "should not be valid if the first_name is missing"
      before { @user.name="" }
      it { is_expected.to_not be_valid }
  end
end
