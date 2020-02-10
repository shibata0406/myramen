class FavoritesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    current_user.like(@product)
   
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    current_user.unlike(@product)
    
  end
end
