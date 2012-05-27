require 'spec_helper'

describe Appointment do

  context "finding appointments" do

    let(:user) { User.make(:email => 'a@a.com') }
    let(:other_user) { User.make(:email => 'b@b.com') }
    let(:client) { Client.make }
    let(:appointment_type) { AppointmentType.make(:user => user)}
    let(:other_appointment_type) { AppointmentType.make(:user => other_user)}

    before :each do
      Appointment.create!(
        :user => user,
        :client => client,
        :start_time => DateTime.parse('2012-01-01 10:00'),
        :appointment_type => appointment_type
      )

      Appointment.create!(
        :user => user,
        :client => client,
        :start_time => DateTime.parse('2012-01-01 12:00'),
        :appointment_type => appointment_type
      )

      Appointment.create!(
        :user => user,
        :client => client,
        :start_time => DateTime.parse('2012-01-02 10:00'),
        :appointment_type => appointment_type
      )

      Appointment.create!(
        :user => other_user,
        :client => client,
        :start_time => DateTime.parse('2012-01-01 10:00'),
        :appointment_type => other_appointment_type
      )

    end

    describe "by user and day" do
      it "finds only relevant appointments" do
        Appointment.find_by_user_and_day(user, DateTime.parse('2012-01-01 3:00')).size.should == 2
      end
    end

  end

end