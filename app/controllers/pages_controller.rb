class PagesController < ApplicationController

  def mercury_update
    page = Page.find_by_label(params[:label])
    page.heading = params[:content][:page_heading][:value] if params[:content][:page_heading]
    page.caption = params[:content][:page_caption][:value] if params[:content][:page_caption]
    page.subheading_1 = params[:content][:page_subheading_1][:value] if params[:content][:page_subheading_1]
    page.subheading_2 = params[:content][:page_subheading_2][:value] if params[:content][:page_subheading_2]
    page.subheading_3 = params[:content][:page_subheading_3][:value] if params[:content][:page_subheading_3]
    page.opening_1 = params[:content][:page_opening_1][:value] if params[:content][:page_opening_1]
    page.opening_2 = params[:content][:page_opening_2][:value] if params[:content][:page_opening_2]
    page.opening_3 = params[:content][:page_opening_3][:value] if params[:content][:page_opening_3]
    page.content_1 = params[:content][:page_content_1][:value] if params[:content][:page_content_1]
    page.content_2 = params[:content][:page_content_2][:value] if params[:content][:page_content_2]
    page.content_3 = params[:content][:page_content_3][:value] if params[:content][:page_content_3]
    page.save
    render text: ""
  end

end
