require 'spec_helper'

describe Unavailability do

  let(:user) { user = User.make }

  describe "initialization" do

    let(:start_time) { DateTime.new(2012,1,1) }
    let(:end_time) { DateTime.new(2012,1,2) }

    it "correctly creates object" do

      unavailability = Unavailability.create(:start_time => start_time, :end_time => end_time, :user => user)

      unavailability.reload
      unavailability.start_time.should == start_time
      unavailability.end_time.should == end_time
      unavailability.user.should == user

    end
  end

  describe "finding future unavailabilities" do


    let!(:past_unavailability) { Unavailability.create(:start_time => DateTime.new(2000,1,1), :end_time => DateTime.new(2000,1,2), :user => user) }
    let!(:future_unavailability) { Unavailability.create(:start_time => DateTime.now - 1.day, :end_time => DateTime.now + 1.day, :user => user) }

    it "returns future unavailabilities" do
      Unavailability.in_future.should include future_unavailability
    end

    it "ignores past unavailabilities" do
      Unavailability.in_future.should_not include past_unavailability
    end

  end

end