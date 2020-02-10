class ProductsController < RankingController
  
  before_action :authenticate_user!, only: [:search, :new]
    
  def index
    @products = Product.limit(20).page(params[:page]).per(20)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def search
  end
  
  def search_show
    @products = Product.where("title LIKE(?)", "%#{params[:keyword]}%").limit(20)
  end
  
  def new
    @product = Product.new
  end
  
  def create
    Product.create(product_params)
    redirect_to action: :index
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end
  
  def update
    review = Review.find(params[:id])
    review.update(update_params)
  end
  
  private
  def product_params
    params.require(:product).permit(:title, :address, :text, :image).merge(user_id: current_user.id)
  end
end