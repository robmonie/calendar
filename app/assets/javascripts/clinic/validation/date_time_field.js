//= require ./validatable_field
Calendar.DateTimeField = Calendar.ValidatableField.extend({
  fieldViewClass: Ember.TextField.extend({

    classNames: ['date-time-field'],
    stepMinute: 5,

    didInsertElement: function() {
      this.$().datetimepicker({
        dateFormat: Calendar.DATE_FORMAT,
        timeFormat: Calendar.TIME_FORMAT,
        stepMinute: this.get('stepMinute')
        // addSliderAccess: true,
        // sliderAccessArgs: { touchonly: true },
      })
    },

    willDestroyElement: function() {
      this.$().datetimepicker('destroy')
    },

    valueBinding: 'parentView.value',
    valueObserver: (function(s, k, v) {
      this.get('parentView.validator').validate(this.get('value'));
    }).observes('value'),

    focusOut: function() {
      this.set('parentView.hasHadFocus', true);
      this.get('parentView.validator').validate(this.get('value'));
    }

  })
});
