class Facilitator < User

  has_many :needs
  has_many :needed_items, through: :needs

end