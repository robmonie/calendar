namespace "CalendarAdmin.appointmentsPage", (exports) ->

  exports.ready = ->

    $("ul.dates").on 'mouseenter', '.appointments li:not(.deleted)', ->
      $(this).addClass('show-delete')

    $("ul.dates").on 'mouseleave', '.appointments li', ->
      $(this).removeClass('show-delete')


    $("ul.dates").on 'click', 'button.delete', ->
      id = $(this).data('id')
      CalendarAdmin.uiHelpers.confirmDelete "/appointments/#{id}",
        'Delete Appointment?',
        'Are you sure you want to delete this appointment?', =>
          $(this).closest('li').addClass('deleted')

    editButton = $(".page-header .edit")
    cancelButton = $(".page-header .cancel")

    editButton.click(->
      $(this).hide()
      cancelButton.show()
      $("ul.dates").addClass('show-delete')
    )

    cancelButton.click(->
      $(this).hide()
      editButton.show()
      $("ul.dates").removeClass('show-delete')
    )