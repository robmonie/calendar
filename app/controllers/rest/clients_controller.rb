class Rest::ClientsController < Rest::BaseController

  load_and_authorize_resource

  def index
    @clients = current_user.business.clients
    render :json => @clients
  end

  def show
    render :json => @client
  end

  def create
    @client.business = current_user.business
    if @client.save
      render :json => @client
    else
      #What to do here ?
    end
  end

  def update
    @client.update_attributes(params[:client])
    if @client.save
      render :json => @client
    else
      #What to do here ?
    end
  end

  def destroy
    if @client.destroy
      head :no_content
    else
      head :bad_request
    end
  end

end