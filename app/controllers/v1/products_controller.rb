class V1::ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def create
    product = Product.new(
    name: params["name"],
    price: params["price"],
    image_url: params["image_url"],
    description: params["description"],
    supplier_id: 1
    )
    if product.save
      render json: product.as_json
      else
        reder json:{errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end

  def index
    products = Product.all.order(:id => :asc)

    search_terms = params["input_search_terms"]
    if search_terms
      products = products.where("name ILIKE ?", "%#{search_terms}%")
    end

    render json: products.as_json
  end

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: {message: "Product successfully destroyed!"}
  end
end
