class PlacesController < ApplicationController

  def index
    @places = Place.all.paginate(page: params[:page], per_page: 10)
  end

end
