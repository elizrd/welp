class PlacesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
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
  
  # Add action to edit details of place
  def edit
    @place = Place.find(params[:id])
    # Only user who created place can edit
    if @place.user != current_user
      return render text: 'Not Allowed, Human Scum', status: :forbidden
    end
  end
  
  # Update a record in Places database
  def update
    # find the record the user wants to update
    @place = Place.find(params[:id])
    # Only user who created place can update
    if @place.user != current_user
      return render text: 'Not Allowed, Human Scum', status: :forbidden
    end
    # Update the record and save changes to the places database
    @place.update_attributes(place_params)
    # Redirect user to homepage
    redirect_to root_path
  end
  
  # Delete a record in Places db
  def destroy
    # find the record the user wants to delete
    @place = Place.find(params[:id])
    # Delete the record
    @place.destroy
    # Redirect user to homepage
    redirect_to root_path
  end
  
  private
  
  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
  
end
