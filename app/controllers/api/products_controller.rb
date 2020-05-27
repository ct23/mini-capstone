class Api::ProductsController < ApplicationController
  def all_products_action
    @products = Product.all
    render 'all_products.json.jb'
  end
  def product1_action
    @product = Product.find_by(id: 1)
    render 'product.json.jb'
  end
  def product2_action
    @product = Product.find_by(id: 2)
    render 'product.json.jb'
  end
  def product3_action
    @product = Product.find_by(id: 3)
    render 'product.json.jb'
  end
  def product4_action
    @product = Product.find_by(id: 4)
    render 'product.json.jb'
  end
end
