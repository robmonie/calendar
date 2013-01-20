Calendar.Availability = DS.Model.extend
  weekdayIndex: DS.attr 'number'
  startHour: DS.attr 'number'
  startMinute: DS.attr 'number'
  endHour: DS.attr 'number'
  endMinute: DS.attr 'number'