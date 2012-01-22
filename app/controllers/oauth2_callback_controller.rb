
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
    user.google_access_token = client.authorization.access_token
    user.google_refresh_token = client.authorization.refresh_token
    user.google_issued_at = DateTime.parse(client.authorization.issued_at.to_s)
    user.google_expires_in = client.authorization.expires_in
    user.save!

    redirect_to current_user.business

  end


  def handle_error(error)
    puts "ERROR: #{error}"
  end



end