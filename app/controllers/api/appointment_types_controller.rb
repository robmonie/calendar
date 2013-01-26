class Api::AppointmentTypesController < Api::BaseController

  include ActiveModel::ForbiddenAttributesProtection

  load_and_authorize_resource

  def index
    @appointment_types = current_user.appointment_types
    render :json => @appointment_types
  end

  def show
    render :json => @appointment_type
  end

  def create
    @appointment_type.user = current_user
    if @appointment_type.save
      render :json => @appointment_type
    else
      #What to do here ?
    end
  end

  def update
    @appointment_type.update_attributes(params[:appointment_type])
    if @appointment_type.save
      render :json => @appointment_type
    else
      #What to do here ?
    end
  end

  def destroy
    if @appointment_type.destroy
      head :no_content
    else
      head :bad_request
    end
  end


end