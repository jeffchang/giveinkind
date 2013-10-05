class DonorItemsController < ApplicationController

  def index
    @donor_items = DonorItem.all
  end

  def show
    @donor_item = DonorItem.find(params[:id])
  end

  def new
    @donor_item = DonorItem.new
  end

  def create
    @donor_item = DonorItem.create(donor_item_params)
    @donor_item.awaiting_pickup = 2
    @donor_item.save
    redirect_to new_donor_item_path, :notice => "#{@donor_item.name} was added successfully."
  end

  def edit
    @donor_item = DonorItem.find(params[:id])
    populate_donor_item_edit_fields
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

  def donor_item_params
    params.require(:donor_item).permit(:name, :description, :oversized, :pickup_details, :subcategory_id, :need_id)
  end
end