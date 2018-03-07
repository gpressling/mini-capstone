class ProductsController < ApplicationController
  def all_products
    products = Product.all
    product_hashes = []
    products.each do |product|
      product_hashes << {
        name: product.name,
        price: product.price,
        image_url: product.image_url,
        description: product.description
      }
    end
    render json: product_hashes
  end
end
