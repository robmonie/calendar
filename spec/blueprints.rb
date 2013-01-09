require 'machinist/active_record'
require 'sham'

User.blueprint do
  email                 "test@example.com"
  password              "password"
  password_confirmation "password"
  first_name            "test"
  last_name             "user"
end


Business.blueprint do
  name "business name"
end

Client.blueprint do
  name "name"
  email 'a@a.com'
  phone '123456'
end

AppointmentType.blueprint do
  name 'name'
  description 'description'
  duration 30
  price 100
end
