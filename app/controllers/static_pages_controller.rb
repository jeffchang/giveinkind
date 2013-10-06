class StaticPagesController < ApplicationController

  skip_before_action :authenticate_user!
  
  def welcome
    if current_user
      redirect_to profile_path(current_user)
    end
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

  def offered
  end

  def browse
  end

  def donate
  end

  def category
  end

  
end