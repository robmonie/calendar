Calendar.Appointment = DS.Model.extend
  startTime: DS.attr 'date'
  endTime: DS.attr 'date'
  comments: DS.attr 'string'
  client: DS.belongsTo('Calendar.Client')