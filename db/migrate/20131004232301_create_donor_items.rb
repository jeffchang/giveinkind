class CreateDonorItems < ActiveRecord::Migration
  def change
    create_table :donor_items do |t|
      t.string :name
      t.text :description
      t.integer :awaiting_pickup
      t.string :image_url
      t.integer :oversized
      t.datetime :pickup_details
      t.text :thanks
      t.references :subcategory
      t.references :user
      t.references :need

      t.timestamps
    end
  end
end