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
    redirect_to root_path, notice:"ブログを編集しました！"
  end
  
  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end
  
  def update
    review = Review.find(params[:id])
    review.update(update_params)
  end
  
  private
  def review_params
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
  
  def update_params
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
