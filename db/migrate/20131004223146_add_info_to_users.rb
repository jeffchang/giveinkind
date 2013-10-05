class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :preferred_email, :string
    add_column :users, :image_url, :string
    add_column :users, :facilitator, :boolean
    add_column :users, :collection_spot_id, :integer
  end
end
