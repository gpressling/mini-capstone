class V1::OrdersController < ApplicationController
  def index
    orders = current_user.orders
    render json: orders.as_json
  end

  def create
    product = Product.find_by(id: params[:product_id].to_i)
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
  

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id].to_i,
      quantity: params[:quantity].to_i,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    if order.save
      render json: {message: 'Order created successfully'}, status: :created
    else
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end
end
