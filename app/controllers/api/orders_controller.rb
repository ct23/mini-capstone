class Api::OrdersController < ApplicationController

  # Validate that user is logged in before executing any method:
  before_action :authenticate_user

  def create

    carted_products = current_user.carted_products.where(status: "carted")
    calc_subtotal = 0
    carted_products.each do |carted_product|
      calc_subtotal += carted_product.product.price * carted_product.quantity
    end

    calc_tax = calc_subtotal * 0.09
    calc_total = calc_subtotal + calc_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total
    )
    if @order.save
      carted_products.update_all(order_id: @order.id, status: "purchased")
      # carted_products.each do |carted_product|
      #   carted_product.update(status: "purchased", order_id: @order.id)
      # end
      render 'show.json.jb'
    else
      render json: { message: "Error", errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Add backend code for the orders index action. Be sure to only return orders for the current user!
  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def show
    @order = Order.find(params[:id])
    render 'show.json.jb'
  end
  

end
