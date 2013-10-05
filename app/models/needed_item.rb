class NeededItem < ActiveRecord::Base

  belongs_to :subcategory
  belongs_to :need

end