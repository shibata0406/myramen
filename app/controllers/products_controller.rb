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
    @tweeted_products = Product.where(image_url: nil)
  end
  
  def new
    @product = Product.new
  end
  
  def create
    
    Product.create(product_params)
    redirect_to action: :index
  end
  
  private
  def product_params
    params.require(:product).permit(:title, :address, :text, :image)
  end
end