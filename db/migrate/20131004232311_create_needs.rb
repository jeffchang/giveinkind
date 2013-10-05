class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :title
      t.text :story
      t.integer :complete
      t.text :thanks
      t.references :facilitator

      t.timestamps
    end
  end
end
