class ReviewsController < RankingController
  
  before_action :authenticate_user!, only: :new
  
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end
  
  def create
    @product = Product.find(params[:product_id])
    Review.create(review_params)
    redirect_to product_path(@product)
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    if review.destroy
       redirect_to root_path, notice:"︎レビューを削除しました！"
    end
  end
  
  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    
  end
  
  def update
    review = Review.find(params[:id])
    review.update(update_params)
      if review.update(update_params)
       redirect_to user_path(current_user), notice:"️レビューを編集しました！"
      end
  end
  
  private
  def review_params
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
  
  def update_params
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
