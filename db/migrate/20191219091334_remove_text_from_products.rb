class RemoveTextFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :text, :text
  end
end
