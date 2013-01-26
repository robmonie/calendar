class Api::Public::ClientsController < Api::Public::BaseController

  before_filter :load_business


  def show
    @client = @business.clients.find(params[:id])
    authorize! :show, @client
    respond_with @client
  end

  private

  def load_business
    @business = Business.find(params[:business_id])
  end

end