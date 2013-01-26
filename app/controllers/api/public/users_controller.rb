class Api::Public::UsersController < Api::Public::BaseController

  before_filter :load_business

  def index
    @users = @business.users
    respond_with @users
  end

  private

  def load_business
    @business = Business.find(params[:business_id])
  end
end