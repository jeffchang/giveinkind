class NeedsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_before_filter :verify_authenticity_token

  def index
    if (params.has_key?(:search_input))
      @needs = Need.fuzzy_search({name: params[:search],
                                  description: params[:search]}, false)
    else
      @needs = Need.all
    end
  end

  def show
    @need = Need.find(params[:id])
  end

  def new
    @need = Need.new
  end

  def create
    @need = Need.create(need_params)
    @need.user = current_user
    @need.image_url = Photo.all.sample.image_url unless @need.image_url
    # or put all such lines in before_create, model
    @need.complete = 0
    @need.save
    redirect_to profile_path(current_user), :notice => "Need created successfully!"
  end

  def edit
    @need = Need.find(params[:id])
    populate_need_edit_fields
  end

  def update
    @need = Need.find(params[:id])
    if @need.user == current_user
      update_need
      redirect_to need_path(@need), :notice => "#{@need.title} was updated successfully."
    else
      redirect_to profile_path(current_user), :notice => "This need doesn't belong to you!"
    end
  end

  def destroy
    @need = Need.find(params[:id])
    @need.destroy
    redirect_to profile_path(current_user), :notice => "Need removed successfully."
  end

  # def search
  #   @found_needs = Need.fuzzy_search({name: params[:search_input],
  #                                     description: params[:search_input]}, false)
  # end

  private

  def need_params
    params.require(:need).permit(:title, :story)
  end
end