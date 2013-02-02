var BASIC_FIELD_TEMPLATE, BASIC_FIELD_TEMPLATE_STRING, CONTROL_GROUP_TEMPLATE;

BASIC_FIELD_TEMPLATE_STRING = "{{view view.fieldView}}{{#if view.hintOrErrorText}}<div class=\"help-block\">{{view.hintOrErrorText}}</div>{{/if}}";
BASIC_FIELD_TEMPLATE = Ember.Handlebars.compile(BASIC_FIELD_TEMPLATE_STRING);
CONTROL_GROUP_TEMPLATE = Ember.Handlebars.compile("<label class=\"control-label\">{{view.label}}</label>\n<div class=\"controls\">\n  " + BASIC_FIELD_TEMPLATE_STRING + "\n</div>");

Calendar.ValidatableField = Ember.View.extend({
  classNameBindings: ['error', 'controlGroup'],
  label: 'Field Label',
  hint: null,
  errorMessages: null,
  controlGroup: true,
  hasHadFocus: false,

  template: function() {
    if (this.get('controlGroup')) {
      return CONTROL_GROUP_TEMPLATE;
    } else {
      return BASIC_FIELD_TEMPLATE;
    }
  }.property('controlGroup'),

  init: function() {

    this.set('validator', Calendar.Validator.create({
      host: this
    }));

    this.set('fieldView', this.get('fieldViewClass'));

    this._super();

  },


  destroy: function() {
    this.get('validator').destroy();
    return this._super();
  },

  isValid: function() {
    return _.isEmpty(this.get('errorMessages'))
  }.property('errorMessages'),

  isError: function() {
    return !this.get('isValid') && this.get('hasHadFocus');
  }.property('isValid', 'hasHadFocus').cacheable(),

  hintOrErrorText: function() {
    if (this.get('isError')) {
      return this._buildErrorMessages()
    } else {
      return this.get('hint');
    }
  }.property('isError', 'hint').cacheable(),

  errorStateDidChange: function() {
    if (this.get('isError')) {
      return this.$().closest('.control-group').addClass('error');
    } else {
      return this.$().closest('.control-group').removeClass('error');
    }
  }.observes('isError'),

  _buildErrorMessages: function() {

    fieldLabel = this.get('label')
    if(fieldLabel) {
      fieldLabel = fieldLabel.toLowerCase()
    } else {
      fieldLabel = 'value'
    }
    return this.get('errorMessages').map(function(message){
      return message.replace("{label}", fieldLabel)
    }).join("<br/>");
  }
});
