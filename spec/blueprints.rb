require 'machinist/active_record'
require 'sham'

User.blueprint do
  email                 "test@example.com"
  password              "password"
  password_confirmation "password"
  first_name            "test"
  last_name             "user"
end

User.blueprint :connected do
  email                 "dragonflycalendar1@gmail.com"
  password              "password"
  password_confirmation "password"
  first_name            "test"
  last_name             "user"
  google_access_token   "ya29.AHES6ZTAiaIm-geN9jHcJBLUM2B1FIMRFo49fZKrbc-Dkx7cGMeQ"
  google_refresh_token  "1/A872kPqhBzb8Y8A3CIfTbet2PDmSYrR8YadW5LqQbA8"
  google_issued_at      10.seconds.ago
  google_expires_in     1
  business              business
end

Business.blueprint do
  name "business name"
end
