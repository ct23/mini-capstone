class Api::OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    calc_subtotal = (product.price) * (params[:quantity].to_i)
    calc_tax = calc_subtotal * 0.09
    calc_total = calc_subtotal + calc_tax

    @order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total
    )
    if @order.save
      # calc_subtotal = @order.product.price * @order.quantity
      # calc_tax = calc_subtotal * 0.09
      # calc_total = calc_subtotal + calc_tax
      # @order.update(
      #   subtotal: calc_subtotal,
      #   tax: calc_tax,
      #   total: calc_total
      # )
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
