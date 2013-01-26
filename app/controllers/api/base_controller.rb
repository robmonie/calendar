class Api::BaseController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url
  end


end