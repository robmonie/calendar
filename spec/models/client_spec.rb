require 'spec_helper'

describe Client do

  context "validation" do

    subject { Client.new() }

    it "requires a name" do
      subject.save
      subject.errors[:name].should_not be_nil
    end

    it "requires an email" do
      subject.save
      subject.errors[:email].should_not be_nil
    end

    it "requires a phone" do
      subject.save
      subject.errors[:phone].should_not be_nil
    end

  end

end