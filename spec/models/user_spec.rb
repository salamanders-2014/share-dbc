require 'rails_helper'

describe User do

  before do
    @user = User.new(first_name: "Joe", last_name: "Test", email: "user@test.com", cohort: "salamanders", username: "testuser", password: "password")
  end

  subject(:user) { @user }

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password_digest) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation) }

  it { is_expected.to be_valid }

  describe "should not be valid if the first_name is missing" do
    before { @user.first_name="" }
    it { is_expected.to_not be_valid }
  end
  describe "should not be valid if the last_name is missing" do
    before { @user.last_name="" }
    it { is_expected.to_not be_valid }
  end
  describe "should not be valid if the cohort_name is missing" do
    before { @user.cohort="" }
    it { is_expected.to_not be_valid }
  end
  describe "should not be valid if the email is missing" do
    before { @user.email="" }
    it { is_expected.to_not be_valid }
  end
  describe "should not be valid if the username is missing" do
    before { @user.username="" }
    it { is_expected.to_not be_valid }
  end
  describe "should not be valid if the password_digest is missing" do
    before { @user.password_digest="" }
    it { is_expected.to_not be_valid }
  end

  describe "when email format is invalid" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                  foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_address|
      before {@user.email = invalid_address}
      it { is_expected.to_not be_valid }
    end
  end

  describe "when email format is valid" do
    addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { is_expected.to be_valid }
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { is_expected.to_not be_valid }
  end

  describe "when password is less than 6 characters" do
    before { @user.password = @user.password_confirmation = 'derp'}
    it { is_expected.to_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { is_expected.to eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { is_expected.to_not eq user_for_invalid_password }
    end
  end
end
