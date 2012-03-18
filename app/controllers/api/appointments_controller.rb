class Api::AppointmentsController < Api::BaseController

  def create

    client = Client.find_by_email(params[:email])

    if client
      client.phone = params[:client][:phone]
    else
      client = Client.new(params[:client])
    end

    user = User.find(params[:user_id])
    appointment_type = AppointmentType.find(params[:appointment_type_id])

    appointment = Appointment.new(
      :user => user,
      :appointment_type => appointment_type,
      :start_time => DateTime.parse(params[:start_time]),
      :client => client,
      :comments => params[:comments]
    )

    if client.save && appointment.valid?
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end

  end

end