require "csv"

products_csv = CSV.readlines("db/products.csv")
products_csv.each do |row|
  Product.create(title: row[1], image_url: row[2], address: row[5], review: row[6], image: row[7])
end

reviews_csv = CSV.readlines("db/reviews.csv")
reviews_csv.each do |row|
  Review.create(review: row[1], rate: row[2], product_id: row[3], user_id: row[6])
end