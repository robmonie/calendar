//= require ./validatable_field
Calendar.TextField = Calendar.ValidatableField.extend({
  fieldViewClass: Ember.TextField.extend({

    valueBinding: 'parentView.value',
    autoFocusBinding: Ember.Binding.oneWay('parentView.autoFocus'),

    valueObserver: (function(s, k, v) {
      this.get('parentView.validator').validate(this.get('value'));
    }).observes('value'),

    focusOut: function() {
      this.set('parentView.hasHadFocus', true);
      this.get('parentView.validator').validate(this.get('value'));
    },

    didInsertElement: function() {
      if(this.get('autoFocus')) {
        this.$().focus();
      }
    }
  })
});
