class NeededItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @needed_items = NeededItem.all
  end

  def show
   @needed_item = NeededItem.find(params[:id])
  end

  def new
    @needed_item = NeededItem.new
  end

  def create
    @needed_item = NeededItem.create(needed_item_params)
    @needed_item.still_needed = 2
    @needed_item.save
    redirect_to new_needed_item_path, :notice => "#{@needed_item.name} was added successfully."
  end

  def edit
    @needed_item = NeededItem.find(params[:id])
    populate_needed_item_edit_fields
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

  def needed_item_params
    params.require(:needed_item).permit(:name, :description, :image_url, :oversized, :subcategory_id, :need_id)
  end
end