class CreateNeededItems < ActiveRecord::Migration
  def change
    create_table :needed_items do |t|
      t.string :name
      t.text :description
      t.integer :still_needed
      t.string :image_url
      t.integer :oversized
      t.references :subcategory
      t.references :need
      t.references :user

      t.timestamps
    end
  end
end
