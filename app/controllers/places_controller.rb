class PlacesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @places = Place.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @place = Place.new
  end
  
  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end
  
  # Add action to show details of single page  
  def show
    @place = Place.find(params[:id])
  end
  
  #Add action to edit details of place
  def edit
    @place = Place.find(params[:id])
  end
  
  def update
    # find the record the user wants to update
    @place = Place.find(params[:id])
    # Update the record and save changes to the places database
    @place.update_attribute(place_params)
    # Redirect user to homepage
    redirect_to root_path
  end
  
  private
  
  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
  
end
