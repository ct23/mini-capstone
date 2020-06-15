class Api::CartedProductsController < ApplicationController
  # Validate that user is logged in before executing any method:
  before_action :authenticate_user

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render "index.json.jb"
  end


  def create
    @carted_product = CartedProduct.new(
      status: "carted",
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    if (@carted_product.save)
      render "show.json.jb"
    else
      render json: { errors: @carted_product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    # Doesn't actually destroy, changes status to "removed"
    # Includes logic to only allow access to current_user's carted products,
    # and only allow access to carted_products that are in the "carted" status
    @carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")
    if (@cartedproduct.update(status: "removed"))
      render json: { message: "Product #{params[:id]} removed from cart."}
    else
      render json: { errors: @carted_product.errors.full_messages}, status: unprocessable_entity
    end
  end

end
