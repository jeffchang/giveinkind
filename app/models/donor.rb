class Donor < User

  has_one :collection_spot
  has_many :locations
  has_many :donor_items

end