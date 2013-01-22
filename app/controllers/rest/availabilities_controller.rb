class Rest::AvailabilitiesController < Rest::BaseController

  load_and_authorize_resource

  def index
    @availabilities = current_user.availabilities
    render :json => @availabilities
  end

  def show
    render :json => @availability
  end

  def create
    @availability.user = current_user
    if @availability.save
      render :json => @availability
    else
      #What to do here ?
    end
  end

  def update
    @availability.update_attributes(params[:availability])
    if @availability.save
      render :json => @availability
    else
      #What to do here ?
    end
  end

  def destroy
    if @availability.destroy
      head :no_content
    else
      head :bad_request
    end
  end

end