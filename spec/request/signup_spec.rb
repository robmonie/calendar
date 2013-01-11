require 'spec_helper'

describe "the signup process", :type => :request do

  context "signing up as a new user" do

    before :each do
     visit new_signup_path
     fill_in 'Business name', :with => "My Business"
     fill_in 'First name', :with => "John"
     fill_in 'Last name', :with => "Doe"
     fill_in 'Email', :with => "john@example.com"
     fill_in 'Password', :with => "password"
     fill_in 'Password confirmation', :with => "password"
     click_button "Sign up"
    end

    it "creates a new user" do
      User.last.email.should eql 'john@example.com'
    end

    it "creates a new business" do
      Business.last.name.should eql 'My Business'
    end

    it "redirects to the new business page" do
      current_path.should eql business_path(Business.last)
    end

  end

  context "sign in / sign out process" do

    before :each do
      @business = Business.make
      @user = User.make(:business => @business)
    end

    it "user can sign in and sign out" do
      visit root_path
      click_link 'Sign in'
      fill_in 'Email', :with => 'test@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Sign in'

      current_path.should eql business_path(@business)
      page.find('h1').should have_content @user.first_name
      page.should have_content @business.name

      click_link "Sign out"
      current_path.should eql root_path
    end

  end


end