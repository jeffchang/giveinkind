class NeedsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @needs = Need.all
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
    @need.complete = 0
    @need.save
  end

  def edit
    @need = Need.find(params[:id])
    populate_need_edit_fields
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

  def need_params
    params.require(:need).permit(:title, :story)
  end
end