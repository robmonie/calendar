require 'spec_helper'
require 'cancan/matchers'

describe Ability do

  context "user with user role" do

    before :each do
      @business = Business.make
      @user = User.make(:business => @business, :role => 'user')
      @ability = Ability.new(@user)
    end

    context "with their own business" do
      context "can" do
        it "read" do
          @ability.should be_able_to(:read, @business)
        end
      end

      context "can not" do
        [:manage, :create, :update, :destroy].each do |action|
          it "#{action} a business" do
            @ability.should_not be_able_to(action, @business)
          end
        end
      end
    end

    context "with another business" do
      context "can not" do
        [:manage, :create, :update, :destroy, :read].each do |action|
          it "#{action} a business" do
            @ability.should_not be_able_to(action, Business.make)
          end
        end
      end
    end
  end


  context "user with business_admin role" do

    before :each do
      @business = Business.make
      @user = User.make(:business => @business, :role => 'business_admin')
      @ability = Ability.new(@user)
    end

    context "with their own business" do
      context "can" do
        [:read, :update].each do |action|
          it "#{action} a business" do
            @ability.should be_able_to(action, @business)
          end
        end
      end

      context "can not" do
        [:create, :destroy, :manage].each do |action|
          it "#{action} a business" do
            @ability.should_not be_able_to(action, @business)
          end
        end
      end
    end

    context "with another business" do
      context "can not" do
        [:read, :create, :update, :destroy, :manage].each do |action|
          it "#{action} a business" do
            @ability.should_not be_able_to(action, Business.make)
          end
        end
      end
    end
  end

  context "user with app_admin role" do
    before :each do
      @business = Business.make
      @user = User.make(:business => @business, :role => 'app_admin')
      @ability = Ability.new(@user)
    end

    context "can" do
      it "manage a business" do
        @ability.should be_able_to(:manage, @business)
      end
    end
  end

  context "anonymous user" do

    before :each do
      @ability = Ability.new(nil)
    end

    context "can not" do
      [:manage, :create, :update, :destroy, :read].each do |action|
        it "#{action} a business" do
          @ability.should_not be_able_to(action, Business.make)
        end
      end
    end
  end

end