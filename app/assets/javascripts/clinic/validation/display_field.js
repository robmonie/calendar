//= require ./validatable_field
Calendar.DisplayField = Calendar.ValidatableField.extend({
  fieldViewClass: Ember.View.extend({

    valueBinding: Ember.Binding.oneWay('parentView.value'),
    classNames: ['display-value'],

    _updateElementValue: Ember.observer(function() {

      // We do this check so cursor position doesn't get affected in IE
      var value = this.get('value'), $el = this.$();

      if ($el && value !== $el.text()) {
        $el.text(value);
      }
    }, 'value'),

    init: function() {
      this._super();
      this.on("didInsertElement", this, this._updateElementValue);
    }
  })
});
