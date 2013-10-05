class Category < ActiveRecord::Base

  has_many :subcategories
  has_many :needed_items, through: :subcategories
  has_many :donor_items, through: :subcategories

end