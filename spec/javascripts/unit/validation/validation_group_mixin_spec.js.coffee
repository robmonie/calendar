#= require unit_spec_helper

describe "validation/validation_group_mixin_spec", ->

  validationGroup = null

  beforeEach ->
    validationGroup = Ember.Object.createWithMixin(Calendar.ValidationGroupMixin)


