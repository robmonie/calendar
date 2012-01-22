class Api::PractitionersController < Api::BaseController

  before_filter :load_business

  def index
    @practitioners = @business.users
    respond_with @practitioners
  end

  private

  def load_business
    @business = Business.find(params[:business_id])
  end
end