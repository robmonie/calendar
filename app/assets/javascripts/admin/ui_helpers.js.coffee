namespace "CalendarAdmin.uiHelpers", (exports) ->

  showingModal = false

  exports.confirmDelete = (targetUrl, title, message, callback) ->

    html = """
      <div class=\"modal fade\">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>
            <h3>#{title}</h3>
          </div>
          <div class="modal-body">
            #{message}
          </div>
          <div class="modal-footer">
            <a href="#" class="btn btn-primary delete">Yes, delete</a>
            <a href="#" class="btn cancel">No, cancel</a>
          </div>
      </div>
    """

    modal = $(html).appendTo("body").modal('show')
    showingModal = true

    modal.on('hidden', ->
      showingModal = false
      modal.remove()
    )
    modal.find('.modal-footer .cancel').on('click', ->
      modal.modal('hide')
    )

    modal.find('.modal-footer .delete').on('click', ->
      $.ajax(
        url: targetUrl
        type: 'DELETE'
      ).done((response) ->
        if callback
          callback()
        else
          window.location.reload()
      )

      modal.modal('hide')
    )

