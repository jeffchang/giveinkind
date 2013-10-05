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
    # @story_params = {}
    # @story = Story.find(params[:id])
    # if @story.user == current_user
    #   process_upload
    #   if params[:story] && params[:story][:upload]
    #     edit_page_upload
    #     flash.now[:success] = "File uploaded! Please edit for formatting as you see fit."
    #     render :edit
    #   else
    #     update_story
    #     update_node
    #     if @story.update_attributes(@story_params)
    #       redirect_to story_path(@story.node), :notice => "#{@story.title} was updated successfully."
    #     else
    #       render :edit, :alert => "Updates could not be saved. Please see the errors below."
    #     end
    #   end
    # else
    #   redirect_to profile_path(current_user), :notice => "You don't own this part of the story!"
    # end
  end

  def destroy
    # story = Story.find(params[:id])
    # story.destroy
    # redirect_to stories_path, :notice => "Story removed successfully."
  end

  private

  def collection_spot_params
    params.require(:collection_spot).permit(:name, :address_1, :address_2, :city, :region_state, :postcode, :country, :directions)
  end
end