task "db:seed" do

  if Business.count > 0
    puts "*** data already seeded ***"
  else

    business = Business.create!(:name => 'My Business')
    puts "Created business"

    admin_user = User.create!(:first_name => 'app_admin', :last_name => 'user', :email => 'app_admin@calendar.com', :password => 'password', :password_confirmation => 'password', :role => 'app_admin')
    business_user = business.users.create!(:first_name => 'business_admin', :last_name => 'user', :email => 'business_admin@calendar.com', :password => 'password', :password_confirmation => 'password', :role => 'business_admin')
    puts "Created users"

    appointmentType = AppointmentType.create!(:user_id => business_user.id, :name => 'Massage', :duration => 60, :description => "Remedial massage", :price => 75.0)
    puts "Created appointment type"

    Availability.create!(:user_id => business_user.id, :start_hour => 10, :start_minute => 0, :end_hour => 20, :end_minute => 0, :weekday_index => 3)
    Availability.create!(:user_id => business_user.id, :start_hour => 10, :start_minute => 30, :end_hour => 20, :end_minute => 0, :weekday_index => 5)
    Availability.create!(:user_id => business_user.id, :start_hour => 10, :start_minute => 0, :end_hour => 17, :end_minute => 0, :weekday_index => 6)
    puts "Added availability to #{business_user.full_name}"
  end

end