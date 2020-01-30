class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 1, maximum: 20 }
  validates :image, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :image
  has_many :reviews
  has_many :favorites
  has_many :products, through: :favorites
  
  def like(product)
    self.favorites.find_or_create_by(product_id: product.id)
  end
  
  def unlike(product)
    favorite = Favorite.find_by(product_id: product.id)
    favorite.destroy if favorite
  end
end
