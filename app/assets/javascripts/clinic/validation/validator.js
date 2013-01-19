Calendar.Validator = Ember.Object.extend({
  host: null,
  init: function() {
    var host, key, rules, validationGroup, validator, validators, validatorOptions, _i, _len, _results;
    this._super();
    host = this.get('host');
    validationGroup = host.nearestWithProperty("isValidationGroup"); //nearestInstanceOf doesn't seemt to work with mixin ?

    if (validationGroup) {
      this.set('validationGroup', validationGroup);
      validationGroup.notifyValidity(this, true);
    }

    this.set('rules', rules = []);
    this.set('required', host.get('required'));
    rules = this.get('rules');
    validators = host.get('validators');
    if(!validators) {
      return;
    }

    if (typeof validators === 'string') {
      unparsedValidators = validators.split(' ');
      validators = [];

      unparsedValidators.forEach(function(v, i) {

        var pos, matches, constraint, key, options;

        pos = v.indexOf('(');
        if(pos >= 0 ) {
          key = v.substr(0, pos);
          matches = v.match(/\((\w+|.*)\)/);
          if(matches && matches.length == 2) {
            constraint = matches[1];
          }
        } else {
          key = v;
        }
        if(constraint) {
          options = {constraintString: constraint};
        }
        validator = Calendar.validatorRegistry.byKey(key, options);
        rules.pushObject(validator);
      });
    } else {
      validators.forEach(function(validator) {
        validator = Calendar.validatorRegistry.byKey(validator.key, validator.options);
        rules.pushObject(validator);
      });
    }


  },

  validateAgainstHostField: function() {
    this.set('host.hasHadFocus', true);
    this.validate(this.get('host.value') || this.get('host.selection'));
  },

  validate: function(value) {

    var errorMessages, errors, requiredRule, rule, rules, _i, _len;
    errors = this.get('errors');
    rules = this.get('rules');
    errorMessages = [];
    if (this.get('required')) {
      requiredRule = Calendar.validatorRegistry.byKey('required');
      if (!requiredRule.isValid(value)) {
        errorMessages.pushObject(requiredRule.message);
      }
    }
    if (!errorMessages.length) {
      for (_i = 0, _len = rules.length; _i < _len; _i++) {
        rule = rules[_i];
        if (!rule.isValid(value)) {
          errorMessages.pushObject(typeof rule.message == 'function' ? rule.message() : rule.message);
        }
      }
    }

    return this.set('host.errorMessages', errorMessages);
  },

  destroy: function() {
    var validationGroup;
    if (validationGroup = this.get('validationGroup')) {
      validationGroup.unregister(this);
    }
    return this._super();
  },

  notifyValidity: (function() {
    var validationGroup;
    if (validationGroup = this.get('validationGroup')) {
      validationGroup.notifyValidity(this, this.get('host.isValid'));
    }
  }).observes('host.isValid')

});