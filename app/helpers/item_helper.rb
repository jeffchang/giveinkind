module ItemHelper

  def populate_donor_item_edit_fields
    @existing_name = @donor_item.name
    @existing_description = @donor_item.description
    @existing_status = @donor_item.awaiting_pickup
    @existing_image = @donor_item.image_url
    @existing_oversized = @donor_item.oversized
    @existing_details = @donor_item.pickup_details
    @existing_subcategory = @donor_item.subcategory_id
    @existing_need_id = @donor_item.need_id
    @existing_thanks = @donor_item.thanks
  end

  def populate_needed_item_edit_fields
    @existing_name = @needed_item.name
    @existing_description = @needed_item.description
    @existing_status = @needed_item.still_needed
    @existing_image = @needed_item.image_url
    @existing_oversized = @donor_item.oversized
    @existing_subcategory = @needed_item.subcategory_id
    @existing_need_id = @needed_item.need_id
  end

  def populate_need_edit_fields
    @existing_title = @need.title
    @existing_story = @need.story
    @existing_status = @need.complete
    @existing_thanks = @need.thanks
  end

  def update_needed_item
    @needed_item.update_attributes(needed_item_params)
  end

  def update_donor_item
    @donor_item.update_attributes(donor_item_params)
  end

  def update_need
    @need.update_attributes(need_params)
  end

end