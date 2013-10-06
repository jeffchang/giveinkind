class DonorItem < ActiveRecord::Base

  belongs_to :user
  belongs_to :subcategory
  belongs_to :needed_item
  belongs_to :collection_spot
  belongs_to :location

end