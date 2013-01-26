class Api::AppointmentsController < Api::BaseController

  load_and_authorize_resource

  def index
    @appointments = current_user.appointments
    render :json => @appointments
  end

  def show
    render :json => @appointment
  end

  def create
    @appointment.user = current_user
    if @appointment.save
      render :json => @appointment
    else
      #What to do here ?
    end
  end

  def update
    @appointment.update_attributes(params[:appointment])
    if @appointment.save
      render :json => @appointment
    else
      #What to do here ?
    end
  end

  def destroy
    if @appointment.destroy
      head :no_content
    else
      head :bad_request
    end
  end


end