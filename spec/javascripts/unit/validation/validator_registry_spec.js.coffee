#= require unit_spec_helper

describe "validation/validator_registry", ->

  describe "required validator", ->

    validator = Calendar.validatorRegistry.byKey('required')

    it "returns true if present", ->
      validator.isValid("value").should.be.true

    it "returns false if not present", ->
      validator.isValid("").should.be.false

  describe "email validator", ->

    validator = Calendar.validatorRegistry.byKey('email')

    it "returns true for a basic valid email", ->
      validator.isValid('a@a.com').should.be.true

    describe "returns false when", ->

      it "no @ symbol", ->
        validator.isValid('aa.com').should.be.false

      it "no tld", ->
        validator.isValid('aa@com').should.be.false

      it "no username", ->
        validator.isValid('@aa.com').should.be.false

      it "ends in dot", ->
        validator.isValid('aa@a.').should.be.false

  describe "number validator", ->
    validator = Calendar.validatorRegistry.byKey('number')

    it "returns true for an integer", ->
      validator.isValid("100").should.be.true


    it "returns true for a decimal", ->
      validator.isValid("100.111").should.be.true

    it "returns false for a character", ->
      validator.isValid("a").should.be.false


  describe "maxLength validator", ->

    validatorConfiguredDirectly = Calendar.validatorRegistry.byKey('maxLength').create(max: 2)
    validatorConfiguredViaConstraintString = Calendar.validatorRegistry.byKey('maxLength').create(constraintString: "2")

    [validatorConfiguredDirectly, validatorConfiguredDirectly].forEach (validator) ->

      describe validator, ->

        it "returns true if under the max", ->
          validator.isValid(".").should.be.true

        it "returns true if equal to the max", ->
          validator.isValid("..").should.be.true

        it "return false if exceeds the max", ->
          validator.isValid("...").should.be.false

  describe "minLength validator", ->

    validatorConfiguredDirectly = Calendar.validatorRegistry.byKey('minLength').create(min: 2)
    validatorConfiguredViaConstraintString = Calendar.validatorRegistry.byKey('minLength').create(constraintString: "2")

    [validatorConfiguredDirectly, validatorConfiguredDirectly].forEach (validator) ->

      describe validator, ->

        it "returns true if over the min", ->
          validator.isValid("...").should.be.true

        it "returns true if equal to the min", ->
          validator.isValid("..").should.be.true

        it "return false if under the min", ->
          validator.isValid(".").should.be.false


  describe "number range validator", ->

    validatorConfiguredDirectly = Calendar.validatorRegistry.byKey('numberRange').create(min: 2, max: 3)
    validatorConfiguredViaConstraintString = Calendar.validatorRegistry.byKey('numberRange').create(constraintString: "2..3")

    [validatorConfiguredDirectly, validatorConfiguredDirectly].forEach (validator) ->

      describe validator, ->

        it "returns true if within the range", ->
          [validator.get('min')..validator.get('max')].forEach (value) ->
            validator.isValid(String(value)).should.be.true

        it "returns false if below the range", ->
          validator.isValid("1").should.be.false

        it "returns false if above the range", ->
          validator.isValid("4").should.be.false





























































