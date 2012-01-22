class ApplicationController < ActionController::Base

  protect_from_forgery

  def self.page_name(page, options = {})
    before_filter(options) do |controller|
      controller.instance_variable_set('@page_name', "#{page}-page" )
    end
  end

  def after_sign_up_path_for(resource)
    redirect_to welcome_business_path current_user.business
  end

  def after_sign_in_path_for(resource)
    business_path(current_user.business)
  end

end
