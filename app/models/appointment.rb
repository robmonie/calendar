class Appointment

  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  validates_presence_of :start_time, :end_time, :client, :comments

  attr_accessor :start_time, :end_time, :client, :comments

  def initialize(data)
    @user = data[:user]
    @client = data[:client]
    @appointment_type = data[:appointment_type]
    @start_time = data[:start_time]
    @end_time = @start_time + @appointment_type.duration.minutes
    @comments = data[:comments]
  end

end