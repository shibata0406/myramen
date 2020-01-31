class Product < ApplicationRecord

  has_many :reviews
  has_many :users, through: :favorites
  has_many :favorites
  has_one_attached :image
end
