class Subcategory < ActiveRecord::Base

  belongs_to :category
  has_many :needed_items
  has_many :donor_items

end