class DonorItemsController < ApplicationController

  def index
    @donor_items = DonorItem.all
    categories_and_subcategories
  end

  def show
    @donor_item = DonorItem.find(params[:id])
  end

  def new
    @donor_item = DonorItem.new
    categories_and_subcategories
  end

  def create
    @donor_item = DonorItem.create(donor_item_params)
    @donor_item.awaiting_pickup = 2

    if params[:subcategory_id] and params["subcategory_id"] != ""
      @donor_item.subcategory = Subcategory.find(params[:subcategory_id])
    end
    if params[:image_url] && params[:image_url] != ""
      @donor_item.image_url = params[:image_url]
    else
      @donor_item.image_url = GoogleAjax::Search.images(donor_item_params[:name])[:results][0][:url] rescue Photo.all.sample.image_url
    end

    if @donor_item.needed_item_id
      @needed_item = NeededItem.find(params[:id])
      @needed_item.still_needed = 1
      @needed_item.save
    end
    
    @donor_item.user = current_user
    @donor_item.save
    redirect_to new_donor_item_path, :notice => "#{@donor_item.name} was added successfully."
  end

  def edit
    @donor_item = DonorItem.find(params[:id])
    populate_donor_item_edit_fields
    categories_and_subcategories
  end

  def update
    @donor_item = DonorItem.find(params[:id])
    if @donor_item.user == current_user
      update_donor_item
      if params[:subcategory_id] and params["subcategory_id"] != ""
        @donor_item.subcategory = Subcategory.find(params[:subcategory_id])
      end
      if params[:image_url] && params[:image_url] != ""
        @donor_item.image_url = params[:image_url]
      end
      @donor_item.save
      redirect_to donor_item_path(@donor_item), :notice => "#{@donor_item.name} was updated successfully."
    else
      redirect_to profile_path(current_user), :notice => "This isn't one of your donations!"
    end
  end

  def destroy
    @donor_item = DonorItem.find(params[:id])
    @donor_item.destroy
    redirect_to profile_path(current_user), :notice => "Donation removed successfully."
  end

  def update_subcategories
    category = Category.find(params[:category_id])
    subcategories = category.subcategories
    render :update do |page|
      page.replace_html 'subcategories', :partial => 'subcategories', :object => subcategories
    end
  end

  def donate
    @donor_item = DonorItem.new
    categories_and_subcategories
    @needed_item = NeededItem.find(params[:id])
  end

  private

  def donor_item_params
    params.require(:donor_item).permit(:name, :description, :oversized, :pickup_details, :subcategory_id, :needed_item_id)
  end
end