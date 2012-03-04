require 'spec_helper'

describe Timeslot do

  context "timeslot availability" do

    let(:unavailable_timeslots) do
      [Timeslot.new(:start_time => Time.parse('2012-01-01T10:30:00+00:00'), :end_time => Time.parse('2012-01-01T11:30:00+00:00'))]
    end

    it "is not available if it overlaps the start of existing timeslot" do
      timeslot = Timeslot.new(:start_time => Time.parse('2012-01-01T10:00:00+00:00'), :end_time => Time.parse('2012-01-01T11:00:00+00:00'))
      Timeslot.find_overlapping_timeslot(unavailable_timeslots, timeslot).should eql unavailable_timeslots[0]
    end

    it "is not available if it overlaps the end of an existing timeslot" do
      timeslot = Timeslot.new(:start_time => Time.parse('2012-01-01T11:00:00+00:00'), :end_time => Time.parse('2012-01-01T12:00:00+00:00'))
      Timeslot.find_overlapping_timeslot(unavailable_timeslots, timeslot).should eql unavailable_timeslots[0]
    end

    it "is not available if it is contained by an existing timeslot" do
      timeslot = Timeslot.new(:start_time => Time.parse('2012-01-01T10:45:00+00:00'), :end_time => Time.parse('2012-01-01T11:15:00+00:00'))
      Timeslot.find_overlapping_timeslot(unavailable_timeslots, timeslot).should eql unavailable_timeslots[0]
    end

    it "is not available if it is exactly the same as and existing timeslot" do
      timeslot = Timeslot.new(:start_time => Time.parse('2012-01-01T10:45:00+00:00'), :end_time => Time.parse('2012-01-01T11:15:00+00:00'))
      Timeslot.find_overlapping_timeslot(unavailable_timeslots, timeslot).should eql unavailable_timeslots[0]
    end

    it "is available if it starts at the end of an existing timeslot" do
      timeslot = Timeslot.new(:start_time => Time.parse('2012-01-01T11:30:00+00:00'), :end_time => Time.parse('2012-01-01T12:00:00+00:00'))
      Timeslot.find_overlapping_timeslot(unavailable_timeslots, timeslot).should be_nil
    end

    it "is available if it ends at the start of an existing timeslot" do
      timeslot = Timeslot.new(:start_time => Time.parse('2012-01-01T10:00:00+00:00'), :end_time => Time.parse('2012-01-01T10:30:00+00:00'))
      Timeslot.find_overlapping_timeslot(unavailable_timeslots, timeslot).should be_nil
    end

  end

end
