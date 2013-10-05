class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :preferred_email, :string
    add_column :users, :image_url, :string
  end
end
