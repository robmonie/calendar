class AppointmentMailer < ActionMailer::Base


  def practitioner_email(appointment)
    @appointment = appointment
    practitioner = appointment.user
    @formatted_start_time = appointment.start_time.in_time_zone(practitioner.timezone).strftime('%d/%m/%y %I:%M %p')

    mail :subject => "New Appointment - #{@formatted_start_time}",
         :from => practitioner.email,
         :to => practitioner.email
  end

end