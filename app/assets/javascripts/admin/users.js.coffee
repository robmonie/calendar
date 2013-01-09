
namespace "CalendarAdmin.userPage", (exports) ->

  showingModal = false
  # userId = $("ul.appointment-types").attr('data-user-id')

  exports.init = ->
    initAddAppointmentType()
    initEditAppointmentType()
    initAddBusyTime()
    initEditBusyTime()

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

  initAddBusyTime = ->
    $(".add-busy-time").on('click', ->
      href = $(this).attr('href')
      showInModal(href) if not showingModal
      return false
    )


  initEditBusyTime = ->
    $("ul.busy-times li a").on('click', ->
      href = $(this).attr('href')
      method = $(this).attr('data-method')
      if method == 'destroy'
        CalendarAdmin.uiHelpers.confirmDelete(href,
          "Delete BusyTime",
          "Are you sure you want to delete this busy time?")
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
      form = modal.find('form')
      validator = form.validate({
        errorPlacement: (error, element) ->
          error.appendTo(element.closest(".control-group"))
        highlight: (element, errorClass) ->
          $(element).closest('.control-group').addClass('error')
        unhighlight: (element, errorClass) ->
          $(element).closest('.control-group').removeClass('error')
      })

      form.find('input, textarea').tooltip
        trigger: 'manual'
        placement: 'right'
        title: ->
          $(this).closest('.control-group').find('label.error').text()

      .on 'focus', ->
        if $(this).closest('.control-group').hasClass('error')
          $(this).tooltip('show')
      .on 'blur', ->
        $(this).tooltip('hide')


      modal.on('hidden', ->
        showingModal = false
        modal.remove()
      )
      modal.find('.modal-footer .cancel').on('click', ->
        modal.modal('hide')
      )

      modal.find('.modal-footer .create').on('click', ->
        modal.find('form').submit()
        if validator.valid()
          modal.modal('hide')
      )
    )


