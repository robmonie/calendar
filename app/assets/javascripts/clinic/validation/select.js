//= require ./validatable_field
Calendar.Select = Calendar.ValidatableField.extend({

  fieldViewClass: Ember.Select.extend({

    selectionBinding: 'parentView.selection',
    valueBinding: 'parentView.value',
    contentBinding: Ember.Binding.oneWay('parentView.content'),
    optionLabelPathBinding: Ember.Binding.oneWay('parentView.optionLabelPath'),
    optionValuePathBinding: Ember.Binding.oneWay('parentView.optionValuePath'),
    promptBinding: Ember.Binding.oneWay('parentView.prompt'),

    selectionObserver: (function() {
      return this.get('parentView.validator').validate(this.get('selection'));
    }).observes('selection'),

    focusOut: function() {
      return this.set('parentView.hasHadFocus', true);
    }
  })
});

