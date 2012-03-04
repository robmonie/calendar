module ApplicationHelper

  def flash_messages(additional_classes = nil)
    # error - non-model error - handle model errors within a form
    # alert - devise messages
    # notice - general message to the user - not an error
    # info - ????
    # success - the task you asked for worked!

    #Specify additional classes in the views. Pass a string of additional class values and it will be appended to flash messages for the page
    # - content_for :extra_flash_class, 'some other classes'
    html = %w(error alert notice success info, failure).select do |msg|
      # concat will push the text to rendered page without a <%= %>.
       concat content_tag(:div,
        content_tag(:div,
          flash[msg.to_sym]),
        :id => "flash-message",
        :class => ["alert-#{msg}", additional_classes].join(' ')
       ) unless flash[msg.to_sym].blank?
    end
  end

  def active_path_class(path)
    if path == request.path
      'active'
    else
      ''
    end
  end

  def google_connect_link
    "https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=741011956518.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Foauth2callback&access_type=offline&scope=https%3A%2F%2Fwww.google.com%2Fcalendar%2Ffeeds/&state=tba"
  end

end
