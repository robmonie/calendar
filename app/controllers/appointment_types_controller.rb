class AppointmentTypesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_user
  load_and_authorize_resource
  layout 'plain'

  page_name "appointment-type"

  def index
    @appointment_types = @user.appointment_types
    respond_to do |format|
      format.html
    end
  end

  def new
    @appointment_type = @user.appointment_types.build
  end

  def create
    @appointment_type = @user.appointment_types.build(params[:appointment_type])
    respond_to do |format|
      if @appointment_type.save
        format.html { redirect_to(@user, :notice => 'Appointment type was successfully created.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment_type.update_attributes(params[:appointment_type])
        format.html  { redirect_to(@user, :notice => 'Appointment type was successfully updated.') }
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

  # def show
  #   respond_to do |format|
  #     format.html
  #   end
  # end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

end