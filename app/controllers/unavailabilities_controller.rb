class UnavailabilitiesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_user
  around_filter :use_timezone
  load_and_authorize_resource
  layout 'plain'
  respond_to :html, :except => :destroy
  respond_to :json, :only => :destroy

  page_name "appointment-type"

  def index
    @unavailabilities = @user.unavailabilities
    respond_to do |format|
      format.html
    end
  end

  def new

    start_time = DateTime.now.beginning_of_day
    end_time = DateTime.now.end_of_day

    @unavailability = @user.unavailabilities.build(:start_time => start_time, :end_time => end_time)
  end

  def create
    @unavailability = @user.unavailabilities.build(params[:unavailability])
    respond_to do |format|
      if @unavailability.save
        format.html { redirect_to(@user, :notice => 'Unavailability was successfully created.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def update
    respond_to do |format|
      if @unavailability.update_attributes(params[:unavailability])
        format.html  { redirect_to(@user, :notice => 'Unavailability was successfully updated.') }
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

  def destroy
    if @unavailability.destroy
      flash[:notice] = "Unavailability was successfully deleted"
      respond_with true
    else
      respond_with false
    end
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def use_timezone
    Time.use_zone ActiveSupport::TimeZone.new(@user.timezone) do
      yield
    end
  end

end