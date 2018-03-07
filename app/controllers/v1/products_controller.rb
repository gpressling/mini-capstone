class V1::ProductsController < ApplicationController

  def first_product
    product = Product.first
    render json: {
      name: product.name,
      price: product.price,
      image_url: product.image_url,
      description: product.name,
      }
  end
  def second_product
    product = Product.second
    render json: {
      name: product.name,
      price: product.price,
      image_url: product.image_url,
      description: product.name,
      }
  end
  def third_product
    product = Product.third
    render json: {
      name: product.name,
      price: product.price,
      image_url: product.image_url,
      description: product.name,
      }
  end
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
