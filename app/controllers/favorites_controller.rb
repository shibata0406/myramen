class FavoritesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    current_user.like(@product)
    render "create.js.erb"
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    current_user.unlike(@product)
    render "create.js.erb"
  end
end
