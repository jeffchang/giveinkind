class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @locations = current_user.locations
  end

  def show
   @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    redirect_to locations_path, :notice => "#{@location.name} was added successfully."
  end

  def edit
    @location = Location.find(params[:id])
    populate_location_edit_fields
  end

  def update
    @location = Location.find(params[:id])
    if current_user.locations.include? @location
      update_location
      redirect_to profile_edit_path(current_user), :notice => "#{@location.name} was updated successfully."
    else
      redirect_to profile_edit_path(current_user), :notice => "This isn't one of your locations!"
    end
  end

  def destroy
    @location = Location.find(params[:id])
    if current_user.locations.include? @location
      @location.destroy
      redirect_to profile_edit_path(current_user), :notice => "#{@location.name} was removed successfully."
    else 
      redirect_to profile_edit_path(current_user, :notice => "This isn't one of your locations!"
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address_1, :address_2, :city, :region_state, :postcode, :country)
  end
end