class Product < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :fav_users, through: :favorites
  has_many :favorites, dependent: :destroy
  belongs_to :user
  
  has_one_attached :image
end
