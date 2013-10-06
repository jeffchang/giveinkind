class CollectionSpot < ActiveRecord::Base

  has_many :donor_items
  has_many :users

end