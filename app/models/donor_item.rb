class DonorItem < ActiveRecord::Base

  belongs_to :user
  belongs_to :subcategory
  belongs_to :need
  has_one :collection_spot
  has_one :location

end