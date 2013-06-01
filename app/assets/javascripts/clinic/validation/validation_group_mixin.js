/*
  Mixin to any view that contains validatable fields that should be observed for validity as a group.
*/

Calendar.ValidationGroupMixin = Ember.Mixin.create({

  isValidationGroup: true,

  init: function() {
    this._super();
    this._validityMap = {};
  },

  afterRender: function() {
    if(this.controller) {
      this.controller.set('validationGroup', this);
    }
  },

  notifyValidity: function(validatable, validity) {
    var guid = Ember.guidFor(validatable);
    this._validityMap[guid] = {validity: validity, validatable: validatable};
    this.set('lastUpdated', new Date().getTime() + guid);
  },

  unregister: function(validatable) {
    delete this._validityMap[Ember.guidFor(validatable)];
  },

  validate: function() {
    _.each(_.values(this._validityMap), function(item) {
      item.validatable.validateAgainstHostField();
    });
  },

  isValid: function() {
    return _.all(_.values(this._validityMap), function(item) {
      return item.validity;
    });
  }.property('lastUpdated').cacheable(),

  isInvalid: function() {
    return ! this.get('isValid')
  }.property('isValid').cacheable()

});