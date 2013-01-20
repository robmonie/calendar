Calendar.AppointmentType = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  duration: DS.attr 'number'
  price: DS.attr 'number'
  appointments: DS.hasMany('Calendar.Appointment')

  summary: (->
    "#{@get('name')}: $#{@get('price')} (#{@get('duration')} mins)"
  ).property('name', 'duration', 'price')