class CollectionSpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @collection_spots = CollectionSpot.all
  end

  def show
   @collection_spot = CollectionSpot.find(params[:id])
  end

  def new
    @collection_spot = CollectionSpot.new
  end

  def create
    @collection_spot = CollectionSpot.create(collection_spot_params)
    redirect_to collection_spots_path, :notice => "#{@collection_spot.name} was added successfully."
  end

  def edit
    @collection_spot = CollectionSpot.find(params[:id])
    populate_collection_spot_edit_fields
  end

  def update
    @collection_spot = CollectionSpot.find(params[:id])
    if current_user.facilitator
      update_collection_spot
      redirect_to edit_profile_path(current_user), :notice => "#{@collection_spot.name} was updated successfully."
    else
      redirect_to edit_profile_path(current_user), :notice => "I'm sorry, only facilitators can change collection spots."
    end
  end

  def destroy
    @collection_spot = CollectionSpot.find(params[:id])
    if current_user.facilitator
      @collection_spot.destroy
      redirect_to edit_profile_path(current_user), :notice => "#{@collection_spot.name} was updated successfully."
    else
      redirect_to edit_profile_path(current_user), :notice => "I'm sorry, only facilitators can remove collection spots."
    end
  end

  private

  def collection_spot_params
    params.require(:collection_spot).permit(:name, :address_1, :address_2, :city, :region_state, :postcode, :country, :directions)
  end
end