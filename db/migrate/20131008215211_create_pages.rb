class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :label
      t.string :heading
      t.text :caption
      t.string :subheading_1
      t.text :opening_1
      t.text :content_1
      t.string :subheading_2
      t.text :opening_2
      t.text :content_2
      t.string :subheading_3
      t.text :opening_3
      t.text :content_3

      t.timestamps
    end
  end
end
