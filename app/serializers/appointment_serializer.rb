class AppointmentSerializer < ActiveModel::Serializer

  embed :ids, :include => true

  attributes :id, :start_time, :end_time, :comments

  has_one :client
  has_one :appointment_type

end
