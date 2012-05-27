require 'google/api_client'
require 'httpadapter/adapters/net_http'

class GoogleApiClientFactory

  def self.client
    client = Google::APIClient.new(
      :authorization => :oauth_2,
      :host => 'www.googleapis.com',
      :http_adapter => HTTPAdapter::NetHTTPAdapter.new
    )

    client.authorization.client_id = '741011956518.apps.googleusercontent.com'
    client.authorization.client_secret = 'KvF5nd3459WI4beVX17estG0'
    client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
    client.authorization.redirect_uri = 'http://localhost:3000/oauth2callback'
    client
  end

  def self.client_for_code(code)
    client = GoogleApiClientFactory.client
    client.authorization.code = code
    client
  end

  def self.client_for_user(user)
    client = GoogleApiClientFactory.client
    client.authorization.access_token = user.google_access_token
    client.authorization.refresh_token = user.google_refresh_token

    if user.google_access_token_expired?
      client.authorization.fetch_access_token!
      user.google_access_token = client.authorization.access_token
      user.google_issued_at = DateTime.parse client.authorization.issued_at.to_s
      user.google_expires_in = client.authorization.expires_in
      user.save!
    end

    client
  end

end