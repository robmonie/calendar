class AppointmentsController < ApplicationController

  before_filter :load_business, :except => [:index, :destroy, :success]

  layout :resolve_layout

  page_name "appointments"

  def index
    authenticate_user!
    if params[:start_time]
      start_time = DateTime.parse(params[:start_time])
    else
      start_time = DateTime.now
    end

    start_time = start_time

    appointments = current_user.appointments.where("start_time >= '#{start_time.utc}'")

    @appointments_by_date = {}

    appointments.each do |appointment|
      arr = @appointments_by_date[appointment.start_time.midnight] ||= []
      arr << appointment
    end

  end

  def new
    @appointment = Appointment.new
  end

  def create

    appointment_params = params[:appointment]
    user = User.find(appointment_params[:user_id])

    client = Client.find_by_email_and_business_id(appointment_params[:client][:email], @business.id)


    if client
      client.phone = appointment_params[:client][:phone]
    else
      client = Client.new(appointment_params[:client])
      client.business = @business
    end


    appointment_type = AppointmentType.find(appointment_params[:appointment_type_id])

    @appointment = Appointment.new(
      :user => user,
      :appointment_type => appointment_type,
      :start_time => DateTime.parse(appointment_params[:start_time]),
      :client => client,
      :comments => appointment_params[:comments]
    )

    if client.save && @appointment.save
      AppointmentMailer.practitioner_email(@appointment, current_user).deliver
      if current_user.present?
        redirect_to appointments_path
      else
        flash[:notice] = "Thanks! Your appointment with #{@appointment.user.full_name} has been scheduled for #{@appointment.start_time.in_time_zone(@appointment.user.timezone).strftime('%I:%M %p')} on #{@appointment.start_time.in_time_zone(@appointment.user.timezone).strftime('%a, %d %b')}"
        redirect_to '/appointment/success'
      end
    else
      render @appointment
    end

  end

  # def edit
  #   @appointment = Appointment.find(params[:appointment_id])
  # end

  def destroy
    respond_to do |format|
      format.json {
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        render :json => @appintment
      }
    end

  end

  def success

  end

  private

  def load_business
    @business = Business.find(params[:business_id])
  end

  def resolve_layout
    if current_user.present?
      'application'
    else
      'public'
    end
  end

end
