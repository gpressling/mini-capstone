class V1::ProductsController < ApplicationController
  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description
    product.save
    render json: product.as_json
  end
  def create
    product = Product.new(
    name: params["name"],
    price: params["price"],
    image_url: params["image_url"],
    description: params["description"]
    )
    product.save
    render json: product.as_json
  end

  def show
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end

  def index
    products = Product.all
    render json: products.as_json
  end
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
    all_products = Product.all
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
