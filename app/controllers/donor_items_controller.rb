class DonorItemsController < ApplicationController

  def index
    @donor_items = DonorItem.all
  end

  def show
   @donor_item = DonorItem.find(params[:id])
  end

  def new
    # @parent_node = params[:id] if params[:id]
    # @story = Story.new
    # @story.build_node
  end

  def create
    # story_params = {}
    # process_upload
    # story_params[:title] = node_params[:title]
    # @story = Story.new(story_params)
    # @story.user = current_user
    # create_nodes
    # @story.tag_list = params[:story][:tag_list]
    # if @story.save
    #   redirect_to story_path(@story), :notice => "#{@story.title} was created successfully."
    # else
    #   render :new, :alert => "Story could not be saved. Please see the errors below."
    # end
  end

  def edit
    # @story = Node.find(params[:id]).stories.first
    # populate_edit_fields
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

  # def node_params
  #   params.require(:node).permit(:title, :content, :parent_node)
  # end
end