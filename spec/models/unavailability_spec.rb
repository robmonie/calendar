require 'spec_helper'

describe BusyTime do

  let(:user) { user = User.make }

  describe "initialization" do

    let(:start_time) { DateTime.new(2012,1,1) }
    let(:end_time) { DateTime.new(2012,1,2) }

    it "correctly creates object" do

      busy_time = BusyTime.create(:start_time => start_time, :end_time => end_time, :user => user)

      busy_time.reload
      busy_time.start_time.should == start_time
      busy_time.end_time.should == end_time
      busy_time.user.should == user

    end
  end

  describe "finding future busy_times" do


    let!(:past_busy_time) { BusyTime.create(:start_time => DateTime.new(2000,1,1), :end_time => DateTime.new(2000,1,2), :user => user) }
    let!(:future_busy_time) { BusyTime.create(:start_time => DateTime.now - 1.day, :end_time => DateTime.now + 1.day, :user => user) }

    it "returns future busy_times" do
      BusyTime.in_future.should include future_busy_time
    end

    it "ignores past busy_times" do
      BusyTime.in_future.should_not include past_busy_time
    end

  end

end