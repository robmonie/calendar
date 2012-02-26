
namespace "CalendarAdmin.userPage", (exports) ->

  showingModal = false
  userId = $("ul.appointment-types").attr('data-user-id')

  exports.init = ->
    initAddAppointmentType()
    initEditAppointmentType()

  initAddAppointmentType = ->
    $(".add-appointment-type").on('click', ->
      showInModal("/users/#{userId}/appointment_types/new") if not showingModal
    )


  initEditAppointmentType = ->
    $("ul.appointment-types li").on('click', ->
      appointmentTypeId = $(this).attr('data-id')
      showInModal("/users/#{userId}/appointment_types/#{appointmentTypeId}/edit") if not showingModal
    )


  showInModal = (url) ->
    showingModal = true
    $.ajax(
      url: url
    ).done((html) ->
      modal = $("<div class=\"modal fade\">#{html}</div>").appendTo("body").modal('show')
      modal.on('hidden', ->
        showingModal = false
        modal.remove()
      )
      modal.find('.modal-footer .cancel').on('click', ->
        modal.modal('hide')
      )

      modal.find('.modal-footer .create').on('click', ->
        modal.find('form').submit()
        modal.modal('hide')
      )
    )


