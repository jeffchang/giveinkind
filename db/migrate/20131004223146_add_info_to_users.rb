class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :preferred_email, :string
  end
end
