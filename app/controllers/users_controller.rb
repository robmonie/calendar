class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_user
  authorize_resource

  page_name "user"

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html  { redirect_to(@user, :notice => 'User was successfully updated.') }
      else
        format.html  { render :action => "edit" }
      end
    end
   end

  # def edit
  #     respond_to do |format|
  #       format.html
  #     end
  #   end

  def show
    respond_to do |format|
      format.html
    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

end