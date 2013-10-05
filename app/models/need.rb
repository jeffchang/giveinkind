class Need < ActiveRecord::Base

  belongs_to :facilitator
  has_many :needed_items
  has_many :donor_items

end