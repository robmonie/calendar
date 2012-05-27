class AppointmentsController < Api::BaseController

  layout 'public'

  def new
    @appointment = Appointment.new
    now = DateTime.now
    @date_options =  (0..14).map do |index|
      dt = now + index.days
      value = dt.to_date.to_s(:db)
      display = dt.strftime('%a, %d %b')
      [display, value]
    end

    @date_options.unshift ["Select a date", ""]
  end

  before_filter do
    @business = Business.find(params[:business_id])
  end

  def create

    appointment_params = params[:appointment]

    client = Client.find_by_email(appointment_params[:email])

    if client
      client.phone = appointment_params[:client][:phone]
    else
      client = Client.new(appointment_params[:client])
    end

    user = User.find(appointment_params[:user_id])
    appointment_type = AppointmentType.find(appointment_params[:appointment_type_id])

    @appointment = Appointment.new(
      :user => user,
      :appointment_type => appointment_type,
      :start_time => DateTime.parse(appointment_params[:start_time]),
      :client => client,
      :comments => appointment_params[:comments]
    )

    if client.save && @appointment.save
      flash[:notice] = "Your appointment has been booked"
      redirect_to business_appointment_path(@business, @appointment.sha)
    else
      render @appointment
    end

  end

  def show
    @appointment = Appointment.find_by_sha(params[:appointment_id])
  end



end
