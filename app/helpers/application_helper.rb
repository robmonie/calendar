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
        content_tag(:p,
          flash[msg.to_sym]),
        :id => "flash-message",
        :class => [msg, additional_classes].join(' ')
       ) unless flash[msg.to_sym].blank?
    end
  end

end
