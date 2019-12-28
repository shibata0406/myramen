class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :image_url
      t.text :text
      t.timestamps
    end
  end
end
