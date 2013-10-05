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
    @donor_item = DonorItem.find(params[:id])
    if @donor_item.user == current_user
      update_donor_item
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

  private

  def donor_item_params
    params.require(:donor_item).permit(:name, :description, :oversized, :pickup_details, :subcategory_id, :need_id)
  end
end