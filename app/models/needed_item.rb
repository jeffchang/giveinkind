class NeededItem < ActiveRecord::Base

  belongs_to :subcategory
  belongs_to :need
  belongs_to :user
  has_many :donor_items

end