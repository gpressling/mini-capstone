class V1::CartedProductsController < ApplicationController
  before_action :authenticate_user
  def index
  # carted_products = CartedProduct.where(user_id: current_user.id, status: "carted" )
    carted_products = current_user.carted_products.where(status: "carted")
    prices = carted_product.map { |carted_product| carted_product.product.price }
    render json: carted_products.as_json
  end
  def create
    carted_product = CartedProduct.new(
    user_id: current_user.id,
    product_id: params["product_id"],
    quantity: params["quantity"],
    status: "carted"
    
    )
    if carted_product.save
      render json: carted_product.as_json
      else
        reder json:{errors: carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    render json: {status: "Carted Product Successfully removed!"}
  end
end
