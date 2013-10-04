class AddInfoToFacilitators < ActiveRecord::Migration
  def change
    add_column :facilitators, :preferred_email, :string
  end
end
