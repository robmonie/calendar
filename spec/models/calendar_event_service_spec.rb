require 'spec_helper'

describe CalendarEventService do

  before :each do
    @user = User.make(:connected)
  end

  context "creating retrieving and deleting calendar events" do

    let(:event_data) do
      event_data = {
        :summary => 'Appointment',
        :location => 'Somewhere',
        :start => {
          :dateTime => DateTime.parse('2012-01-01T10:00:00+11:00')
        },
        :end => {
          :dateTime => DateTime.parse('2012-01-01T11:00:00+11:00')
        },
        :attendees => [
          {
            :email => @user.email
          }
        ]
      }
    end

    it "a calendar event can be created, retrieved and deleted" do
      event = CalendarEventService.create(@user, event_data)
      id = event.data.id
      id.should_not be_nil
      retrieved_event = CalendarEventService.findById(@user, id)
      retrieved_event.data.summary.should eql event.data.summary

      result = CalendarEventService.destroy(@user, id)
      result.status.should eql 204

      # lambda { CalendarEventService.findById(@user, id)}.should raise_error(Google::APIClient::ClientError)

    end


    context "finding all calendar events" do

      it "returns the expected number of calendar events" do
        event = CalendarEventService.create(@user, event_data)
        events = CalendarEventService.find_all(@user)
        events.size.should_not eql 1
      end
    end

  end




end