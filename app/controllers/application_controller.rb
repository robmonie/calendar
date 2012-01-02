class ApplicationController < ActionController::Base

  protect_from_forgery

  def after_sign_up_path_for(resource)
    redirect_to current_user.business
  end

  def after_sign_in_path_for(resource)
    business_path(current_user.business)
  end

end
