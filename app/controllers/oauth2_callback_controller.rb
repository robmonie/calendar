
class Oauth2CallbackController < ApplicationController

  before_filter :authenticate_user!

  def index

    error = params[:error]
    code = params[:code]

    if error
      handle_error error
    elsif code
      request_access code
    else
      puts "INVALID CALLBACK"
    end

  end


  private

  def request_access(code)

    client = ::GoogleApiClientFactory.client_for_code(code)
    client.authorization.fetch_access_token!

    user = current_user
    puts client.authorization.inspect
    user.google_access_token = client.authorization.access_token
    user.google_refresh_token = client.authorization.refresh_token
    user.google_issued_at = DateTime.parse(client.authorization.issued_at.to_s)
    user.google_expires_in = client.authorization.expires_in

    if user.google_refresh_token
      user.save!
      user.refresh_calendar_metadata
      redirect_to current_user.business
    else
      existing = User.where(:calendar_id => current_user.calendar_id)
      if existing.length > 0
        flash[:error] =  "You appear to have already authorised this google account with a different login."
      else
        flash[:error] =  "We're having trouble connecting with your calendar. Please try again later or get in touch."
      end
      redirect_to current_user.business
    end


  end


  def handle_error(error)
    puts "ERROR: #{error}"
  end



end