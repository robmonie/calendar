
namespace "CalendarAdmin.userPage", (exports) ->

  showingModal = false
  userId = $("ul.appointment-types").attr('data-user-id')

  exports.init = ->
    initAddAppointmentType()
    initEditAppointmentType()

  initAddAppointmentType = ->
    $(".add-appointment-type").on('click', ->
      href = $(this).attr('href')
      showInModal(href) if not showingModal
      return false
    )


  initEditAppointmentType = ->
    $("ul.appointment-types li a").on('click', ->
      href = $(this).attr('href')
      method = $(this).attr('data-method')
      if method == 'destroy'
        CalendarAdmin.uiHelpers.confirmDelete(href,
          "Delete Appointment Type",
          "Are you sure you want to delete this appointment type?")
      else
        showInModal(href) if not showingModal
      return false
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


