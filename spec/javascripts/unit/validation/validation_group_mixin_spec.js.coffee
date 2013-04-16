#= require unit_spec_helper

describe "validation/validation_group_mixin_spec", ->

  validationGroup = null

  beforeEach ->
    validationGroup = ValidationGroupView.create()

  describe "afterRender", ->
    it "injects itself into controller if present", ->
      controller = Ember.Object.create()
      validationGroup.set('controller', controller)
      validationGroup.afterRender()
      controller.get('validationGroup').should.equal validationGroup


  describe "notifyValidity", ->
    it "updates validity map with validity of validatable", ->
      validatable = Ember.Object.create()
      validationGroup.notifyValidity(validatable, true)
      validationGroup._validityMap[Ember.guidFor(validatable)].validity.should.be.true
      validationGroup._validityMap[Ember.guidFor(validatable)].validatable.should.equal(validatable)

    it "updates the validity of group to valid if all valid", ->
      validatableA = Ember.Object.create()
      validatableB = Ember.Object.create()
      validationGroup.notifyValidity(validatableA, true)
      validationGroup.notifyValidity(validatableB, true)
      validationGroup.get('isValid').should.be.true
      validationGroup.get('isInvalid').should.be.false

    it "updates the validity of group to invalid if any invalid", ->
      validatableA = Ember.Object.create()
      validatableB = Ember.Object.create()
      validationGroup.notifyValidity(validatableA, true)
      validationGroup.notifyValidity(validatableB, false)
      validationGroup.get('isValid').should.be.false
      validationGroup.get('isInvalid').should.be.true

  describe "validate", ->
    it "forces validation for all validators against their host fields", ->
      validatableA = Ember.Object.createWithMixins(validateAgainstHostField: ->)
      validatableB = Ember.Object.createWithMixins(validateAgainstHostField: ->)
      validationGroup.notifyValidity(validatableA, true)
      validationGroup.notifyValidity(validatableB, true)

      sinon.spy(validatableA, 'validateAgainstHostField')
      sinon.spy(validatableB, 'validateAgainstHostField')

      validationGroup.validate()
      validatableA.validateAgainstHostField.should.have.been.calledOnce
      validatableB.validateAgainstHostField.should.have.been.calledOnce

  describe "unregister", ->
    it "removes the validator from the validity map", ->
      validatable = Ember.Object.create()
      validationGroup.notifyValidity(validatable, true)
      validationGroup._validityMap[Ember.guidFor(validatable)].should.not.be.undefined
      validationGroup.unregister(validatable)
      expect(validationGroup._validityMap[Ember.guidFor(validatable)]).to.be.undefined


ValidationGroupView = Ember.Object.extend(Calendar.ValidationGroupMixin)