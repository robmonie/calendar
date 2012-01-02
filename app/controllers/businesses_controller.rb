class BusinessesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def update
    respond_to do |format|
      if @business.update_attributes(params[:business])
        format.html  { redirect_to(@business, :notice => 'Business was successfully updated.') }
      else
        format.html  { render :action => "edit" }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

end