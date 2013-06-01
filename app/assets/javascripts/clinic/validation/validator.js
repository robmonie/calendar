Calendar.Validator = Ember.Object.extend({
  host: null,
  init: function() {

    this._super();

    var validationGroup = this.get('host').nearestWithProperty("isValidationGroup"); //nearestInstanceOf doesn't seemt to work with mixin ?

    if (validationGroup) {
      this.set('validationGroup', validationGroup);
      validationGroup.notifyValidity(this, true);
    }

    this.set('rules', this._extractRules());
    this.set('required', this.get('host.required') === 'true' ? true : false);

  },

  validateAgainstHostField: function() {
    this.set('host.hasHadFocus', true);
    this.validate(this.get('host.value') || this.get('host.selection'));
  },

  validate: function(value) {

    var errorMessages = [],
        errors = this.get('errors'),
        rules = this.get('rules');


    if (this.get('required')) {
      this._validateValueAsRequired(value, errorMessages);
    }

    if (errorMessages.length === 0) {
      this._validateValueAgainstRules(value, rules, errorMessages);
    }

    return this.set('host.errorMessages', errorMessages);
  },

  _extractRules: function() {
    var validatorDefinitions = this.get('host.validators') || [],
        configuredValidators = [],
        validator;

    if (typeof validatorDefinitions === 'string') {
      configuredValidators = this._parseValidatorDefinitions(validatorDefinitions)
    } else if (Ember.isArray(validatorDefinitions)) {
      configuredValidators = validatorDefinitions.map(function(validator) {
        return Calendar.validatorRegistry.byKey(validator.key, validator.options);
      });
    }

    return configuredValidators;

  },

  _parseValidatorDefinitions: function(unparsedValidators) {

    return [].concat(unparsedValidators.split(' ')).map(function(value, i) {

      var pos, matches, constraint, key, options;

      pos = value.indexOf('(');
      if(pos >= 0 ) {
        key = value.substr(0, pos);
        matches = value.match(/\((\w+|.*)\)/);
        if(matches && matches.length == 2) {
          constraint = matches[1];
        }
      } else {
        key = value;
      }
      if(constraint) {
        options = {constraintString: constraint};
      }
      return Calendar.validatorRegistry.byKey(key, options);
    }).compact();

  },

  _validateValueAsRequired: function(value, errorMessages) {

    var requiredRule = Calendar.validatorRegistry.byKey('required');
    if (!requiredRule.isValid(value)) {
      errorMessages.pushObject(requiredRule.message);
    }

  },

  _validateValueAgainstRules: function(value, rules, errorMessages) {
    rules.forEach(function(rule) {
      if (!rule.isValid(value)) {
        errorMessages.pushObject(typeof rule.message === 'function' ? rule.message() : rule.message);
      }
    });
  },

  destroy: function() {
    var validationGroup;
    if (validationGroup = this.get('validationGroup')) {
      validationGroup.unregister(this);
    }
    return this._super();
  },

  notifyValidity: function() {
    var validationGroup;
    if (validationGroup = this.get('validationGroup')) {
      validationGroup.notifyValidity(this, this.get('host.isValid'));
    }
  }.observes('host.isValid')

});