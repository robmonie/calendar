class SignupsController < ApplicationController

  include Devise::Controllers::Helpers
  skip_authorization_check


  def new
    @signup = Signup.new
  end

  def create

    @signup = Signup.new(params[:signup])

    if @signup.save
      sign_in(@signup.user)
      redirect_to @signup.business
    else
      render :action => "new"
    end
  end
end