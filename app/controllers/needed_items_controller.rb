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
    @needed_item = NeededItem.find(params[:id])
    if @needed_item.user == current_user
      update_needed_item
      if @needed_item.need
        redirect_to edit_need_path(@needed_item.need), :notice => "#{@needed_item.name} was updated successfully."
      else
        redirect_to needed_item_path(@needed_item), :notice => "#{@needed_item.name} was updated successfully."
      end
    else
      redirect_to profile_path(current_user), :notice => "This isn't one of your needed items!"
    end
  end

  def destroy
    @needed_item = NeededItem.find(params[:id])
    need = @needed_item.need if @needed_item.need
    @needed_item.destroy
    if need
      redirect_to need_path(need), :notice => "Needed item removed successfully."
    else
      redirect_to profile_path(current_user), :notice => "Needed item removed successfully."
    end
  end

  def search
    # if params[:search_bar] != ""
    #   find_by_title_author_content
    #   if params[:tag_tokens] != ""
    #     @found_stories = Story.all if @found_stories == []
    #     find_stories_by_tag
    #   end
    # else
    #   if params[:tag_tokens] != ""
    #     @found_stories = Story.all
    #     find_stories_by_tag
    #   else
    #     @found_stories = []
    #   end
    # end
  end

  private

  def needed_item_params
    params.require(:needed_item).permit(:name, :description, :image_url, :oversized, :subcategory_id, :need_id)
  end
end