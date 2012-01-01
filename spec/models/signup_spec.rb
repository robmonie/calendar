require 'spec_helper'

describe Signup do

  def new_signup
    Signup.new( :business_name => "my business", :email => "rob@test.com", :first_name => "rob", :last_name => "monie",
                :password => "my password", :password_confirmation => "my password")
  end

  before :each do
    @signup =  new_signup
    @signup.save
  end

  context "signup creation" do
    it "creates a business with specified attributes" do
      Business.find_by_name("my business").should_not be_nil
    end

    it "creates a user with the specified attributes" do
      user = User.last
      user.email.should eql "rob@test.com"
      user.first_name.should eql "rob"
      user.last_name.should eql "monie"
      user.should have_role :business_admin
    end
  end

  context "validation" do
    it { should validate_presence_of(:business_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }

    it "validates uniqueness of email" do
      signup = new_signup
      signup.valid?
      signup.errors[:email].should_not be_nil
    end
  end

end