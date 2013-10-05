class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :region_state
      t.string :postcode
      t.string :country
      t.string :coords
      t.references :donor_item
      t.references :donor

      t.timestamps
    end
  end
end
