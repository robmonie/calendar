class ClinicsController < ApplicationController

  before_filter :authenticate_user!

  layout 'plain'

end