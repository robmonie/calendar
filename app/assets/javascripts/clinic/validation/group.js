Calendar.ValidationGroup = Ember.Mixin.create({

  isValidationGroup: true,

  init: function() {
    this._super();
    this._validityMap = {};
  },

  afterRender: function() {
    this.controller.set('validationGroup', this);
  },

  notifyValidity: function(validatable, validity) {
    this._validityMap[validatable] = {validity: validity, validatable: validatable};
    this.set('lastUpdated', new Date().getTime() + validity.toString());
  },

  unregister: function(validatable) {
    delete this._validityMap[validatable];
  },

  validate: function() {
    _.each(_.values(this._validityMap), function(item) {
      item.validatable.validateAgainstHostField();
    });
  },

  isValid: (function() {
    return _.all(_.values(this._validityMap), function(item) {
      return item.validity;
    });
  }).property('lastUpdated').cacheable(),

  isInvalid: (function() {
    return ! this.get('isValid')
  }).property('isValid').cacheable()

});