require 'spec_helper'

describe User do

  context "setting defaults" do

    it "sets the default role to 'user' when not defined" do
      user = User.make_unsaved
      user.save!
      user.role.should eql :user
    end

    it "does not set role to default value when defined" do
      user = User.make_unsaved(:role => :app_admin)
      user.save!
      user.role.should eql :app_admin
    end

  end

  context "allowable values for role" do
    it "only allows specific values" do
      User::ROLES.each do |role|
        should allow_value(role).for(:role)
      end
      should_not allow_value('invalid role').for(:role)
    end
  end

  context "roles" do

    it "correctly confirms if user has role" do
      user = User.make_unsaved(:role => :user)
      user.save!
      user.has_role?(:user).should be_true
      user.has_role?(:app_admin).should be_false

    end

  end


end