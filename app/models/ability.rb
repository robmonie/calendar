class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    if user
      send("authorize_#{user.role}") unless @user.role == nil
    else
      authorize_anonymous
    end
  end

  def authorize_app_admin
    can :manage, :all
  end

  def authorize_business_admin
    can [:read, :update], Business, :id => @user.business_id
    can [:read, :update], User, :id => @user.id
    can [:read, :create, :update], AppointmentType, :user_id => @user.id
  end

  def authorize_user
    can :read, Business, :id => @user.business_id
    can [:read, :update], User, :id => @user.id
    can [:read, :create, :update], AppointmentType, :user_id => @user.id
  end

  def authorize_anonymous
    can :create, Signup
  end

end
