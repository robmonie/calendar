//= require ./validatable_field
Calendar.TextArea = Calendar.ValidatableField.extend({
  fieldViewClass: Ember.TextArea.extend({

    valueBinding: 'parentView.value',
    valueObserver: (function(s, k, v) {
      this.get('parentView.validator').validate(this.get('value'));
    }).observes('value'),

    focusOut: function() {
      this.set('parentView.hasHadFocus', true);
    }

  })
});
