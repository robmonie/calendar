Calendar.Client = DS.Model.extend
  name: DS.attr 'string'
  email: DS.attr 'string'
  phone: DS.attr 'string'
  appointments: DS.hasMany('Calendar.Appointment')
  gravatarImageUrl: DS.attr 'string'