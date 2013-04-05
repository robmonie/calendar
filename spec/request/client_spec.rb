require 'spec_helper'
require 'request/support/view_model/app_navigation_view'

feature "creating a client", :js => true do

  let(:email) { 'a@a.com'}
  let(:password) { 'password' }

  before :each do
    @business = Business.make
    @user = User.make(
      :business => @business,
      :email => email,
      :password => password,
      :password_confirmation => password,
      :role => 'business_admin')

    visit root_path
    click_link 'Sign in'
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button 'Sign in'

  end

  it "" do
    AppNavigationView.new(page).show_clients
    sleep
  end

end