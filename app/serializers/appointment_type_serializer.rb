class AppointmentTypeSerializer < ActiveModel::Serializer

  attributes :id, :name, :duration, :price, :description

end
