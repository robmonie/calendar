class Appointment < ActiveRecord::Base

  validates_presence_of :start_time, :end_time

  belongs_to :user
  belongs_to :client
  belongs_to :appointment_type

  after_initialize :set_end_time_for_appointment_type, :if => Proc.new { |appointment| appointment.appointment_type.present? && appointment.end_time.blank? }
  after_create :set_sha

  def self.find_by_user_and_day(user, time)
    Appointment.where("user_id = ? AND start_time >= ? AND end_time < ?", user.id, time.beginning_of_day, time.end_of_day)
  end

  def set_end_time_for_appointment_type
    self.end_time = start_time + appointment_type.duration.minutes
  end

  def set_sha
    self.sha = Digest::SHA1.hexdigest("#{id}#{start_time}")
  end

end