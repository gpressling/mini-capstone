class Category < ApplicationRecord
  has_many :cetegory_products
  has_many :products, through: :category_products
end
