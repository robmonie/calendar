//= require ./validatable_field
//= require ../transforms
Calendar.DateTimeField = Calendar.ValidatableField.extend({
  fieldViewClass: Ember.TextField.extend({

    classNames: ['date-time-field'],
    type: Modernizr.touch ? 'datetime' : 'text',
    stepMinute: 5,

    didInsertElement: function() {
      if(!Modernizr.touch) {
        this.$().datetimepicker({
          dateFormat: Calendar.DATE_FORMAT,
          timeFormat: Calendar.TIME_FORMAT,
          stepMinute: this.get('stepMinute')
        })
      }
    },

    willDestroyElement: function() {
      if(!Modernizr.touch) {
        this.$().datetimepicker('destroy')
      }
    },

    // valueBinding: 'parentView.value',

    value: function(key, value) {
      var date, dateString, dateValue, timeString;
      if (arguments.length === 1) {
        date = this.get('parentView.value');
        if (date) {
          if(Modernizr.touch) {
            return date.toISOString();
          } else {
            dateString = $.datepicker.formatDate(Calendar.DATE_FORMAT, date);
            timeString = $.datepicker.formatTime(Calendar.TIME_FORMAT, {
              hour: date.getHours(),
              minute: date.getMinutes()
            });
            return dateString + " " + timeString;
          }
        } else {
          return "";
        }
      } else {
        if(!value) {
          dateValue = null
        } else if(Modernizr.touch) {
          dateValue = new Date(value);
        } else {
          dateValue = $.datepicker.parseDateTime(Calendar.DATE_FORMAT, Calendar.TIME_FORMAT, value);
        }
        this.set('parentView.value', dateValue);
      }
    }.property('parentView.value').cacheable(),

    valueObserver: function() {
      this.get('parentView.validator').validate(this.get('parentView.value'));
    }.observes('parentView.value'),

    focusOut: function() {
      this.set('parentView.hasHadFocus', true);
      this.get('parentView.validator').validate(this.get('value'));
    }

  })
});
