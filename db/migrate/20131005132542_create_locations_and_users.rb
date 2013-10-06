class CreateLocationsAndUsers < ActiveRecord::Migration
  def change
    create_table :locations_users do |t|
      t.references :location
      t.references :user
    end
  end
end
