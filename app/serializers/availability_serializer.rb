class AvailabilitySerializer < ActiveModel::Serializer

  attributes :id, :weekday_index, :start_hour, :start_minute, :end_hour, :end_minute

end
