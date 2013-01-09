class BusyTimesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_user
  around_filter :use_timezone
  load_and_authorize_resource
  layout 'plain'
  respond_to :html, :except => :destroy
  respond_to :json, :only => :destroy

  page_name "appointment-type"

  def index
    @busy_times = @user.busy_times
    respond_to do |format|
      format.html
    end
  end

  def new

    start_time = DateTime.now.beginning_of_day
    end_time = DateTime.now.end_of_day

    @busy_time = @user.busy_times.build(:start_time => start_time, :end_time => end_time)
  end

  def create
    @busy_time = @user.busy_times.build(params[:busy_time])
    respond_to do |format|
      if @busy_time.save
        format.html { redirect_to(@user, :notice => 'BusyTime was successfully created.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def update
    respond_to do |format|
      if @busy_time.update_attributes(params[:busy_time])
        format.html  { redirect_to(@user, :notice => 'BusyTime was successfully updated.') }
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
    if @busy_time.destroy
      flash[:notice] = "BusyTime was successfully deleted"
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