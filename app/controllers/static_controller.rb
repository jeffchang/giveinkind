class StaticController < ApplicationController

  skip_before_action :authenticate_user!
  before_action :assign_path
  
  def welcome
  end

  def about_us
  end

  def blog
  end

  def faqs
  end

  def contact
  end

  def index
  end

  def donate
  end

  def category
  end

  private

  def assign_path
    @page = Page.find_by_label(params[:action])
    if (current_user && current_user.facilitator)
      @static_path = params[:action] 
    end
  end
  
end
