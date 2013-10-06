require 'googleajax'
GoogleAjax.referer = "http://localhost:3000"
GoogleAjax.api_key = "AIzaSyARQ7tB58L6RZ5bEZWju0Gu71eY4t4vj6o"

class NeededItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_before_filter :verify_authenticity_token

  def index
    @needed_items = NeededItem.all
    categories_and_subcategories
  end

  def show
   @needed_item = NeededItem.find(params[:id])
  end

  def new
    @needed_item = NeededItem.new
    categories_and_subcategories
  end

  def create
    @needed_item = NeededItem.create(needed_item_params)
    @needed_item.still_needed = 2
    @needed_item.user = current_user
    @needed_item.save
    redirect_to new_needed_item_path, :notice => "#{@needed_item.name} was added successfully."
  end

  def edit
    @needed_item = NeededItem.find(params[:id])
    categories_and_subcategories
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

  def update_subcategories
    category = Category.find(params[:category_id])
    subcategories = category.subcategories
    render :update do |page|
      page.replace_html 'subcategories', :partial => 'subcategories', :object => subcategories
    end
  end

  def images
    result = GoogleAjax::Search.images(params[:term])[:results]
    urls = []
    result.each do |result|
      urls.append(result[:url])
    end
    render :json => urls
  end

  def search
    @found_items = NeededItem.fuzzy_search({name: params[:search_items], description: params[:search_items]}, false)
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