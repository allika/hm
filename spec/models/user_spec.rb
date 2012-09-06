require 'spec_helper'

describe User do
  before do
    @user = User.new(:email => "user@example.com", :password => "password", :password_confirmation => "password",
                     :created_at => "2012-09-05 16:19:04", :updated_at => "2012-09-06 16:19:04")
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when email has already been taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @user.email = "a"*100+"@exampe.com" }
    it { should_not be_valid }
  end

  describe "when email is not in correct format" do
    before { @user.email = "a!!!!!exampe.com" }
    it { should_not be_valid }
  end

  describe "when email in UPPERCASE" do
    before { @user.email = "ARRR@EXAMPLE.COM" }
    it { should be_valid }
  end

  describe "when email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      @user.reload.email.should == mixed_case_email.downcase
    end
  end

  describe "when password is not present" do
    before { @user.password = "" }
    it { should_not be_valid }
  end

  describe "when password is too long" do
    before { @user.password = "pwd"*100 }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "pwd" }
    it { should_not be_valid }
  end

  describe "when password_confirmation is not present" do
    before { @user.password_confirmation = "" }
    it { should_not be_valid }
  end

  describe "when password doesn't match password_confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

end
