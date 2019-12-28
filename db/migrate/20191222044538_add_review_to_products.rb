class AddReviewToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :review, :text
  end
end
