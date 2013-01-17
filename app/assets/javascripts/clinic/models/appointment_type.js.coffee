Calendar.AppointmentType = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  duration: DS.attr 'number'
  price: DS.attr 'number'