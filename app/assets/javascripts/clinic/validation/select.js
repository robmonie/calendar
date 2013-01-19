//= require ./validatable_field
Calendar.Select = Calendar.ValidatableField.extend({

  fieldViewClass: Ember.Select.extend({

    selectionBinding: 'parentView.selection',
    contentBinding: Ember.Binding.oneWay('parentView.content'),
    optionLabelPathBinding: Ember.Binding.oneWay('parentView.optionLabelPath'),
    optionValuePathBinding: Ember.Binding.oneWay('parentView.optionValuePath'),
    promptBinding: Ember.Binding.oneWay('parentView.prompt'),

    selectionObserver: (function() {
      return this.get('parentView.validator').validate(this.get('selection'));
    }).observes('selection'),

    contentObserver: (function() {
      return this.set('selection', null);
    }).observes('content', 'content.length'),

    focusOut: function() {
      return this.set('parentView.hasHadFocus', true);
    }
  })
});

