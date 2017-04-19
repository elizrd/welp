class PhotosController < ApplicationController
  
  before_action :authenticate_user!

  def create
    # Find place photo belongs to
    @place = Place.find(params[:place_id])
    # Create item for photo in database
    @place.photos.create(photo_params)
    # Redirect to place details page
    redirect_to place_path(@place)
  end

  private

  # Pull data out of photos form  
  def photo_params
    params.require(:photo).permit(:caption, :picture)
  end

end
