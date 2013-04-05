#= require clinic_vendor
#= require ember_spec_config
#= require clinic_app
#= require global_spec_lifecycle
#= require_tree ./support/view_model
#= require ./support/lib/sinon
#= require ./support/lib/chai_sinon
#= require_self

#Stop konacha from reseting the body on each spec
Konacha.reset = ->

# Calendar.deferReadiness()

#stop router from routing url
Calendar.Router.reopen
  location: 'none'

Calendar.reopen
  rootElement: "body"

