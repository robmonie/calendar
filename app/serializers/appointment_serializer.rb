class AppointmentSerializer < ActiveModel::Serializer

  embed :ids

  attributes :id, :start_time, :end_time, :client_id, :appointment_type_id, :comments

end
