class ApplicationController < ActionController::Base

  protect_from_forgery

  def self.page_name(page, options = {})
    before_filter(options) do |controller|
      controller.instance_variable_set('@page_name', "#{page}-page" )
    end
  end

  def after_sign_up_path_for(resource)
    redirect_to edit_user_path(current_user)
  end

  # def after_sign_in_path_for(resource)
  #   "/"
  # end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url
  end

end
