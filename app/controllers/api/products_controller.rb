class Api::ProductsController < ApplicationController
  # def all_products_action
  #   @products = Product.all
  #   render 'all_products.json.jb'
  # end
  # def product1_action
  #   @product = Product.find_by(id: 1)
  #   render 'product.json.jb'
  # end
  # def product2_action
  #   @product = Product.find_by(id: 2)
  #   render 'product.json.jb'
  # end
  # def product3_action
  #   @product = Product.find_by(id: 3)
  #   render 'product.json.jb'
  # end
  # def product4_action
  #   @product = Product.find_by(id: 4)
  #   render 'product.json.jb'
  # end

  # def product_param_action
  #   product_id = params['prod_id'].to_i
  #   @product = Product.find_by(id: product_id)
  #   render 'product.json.jb'

  # Rewriting above methods with RESTful methods
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def show
    @product = Product.find_by(id: params['id'])
    render 'show_product.json.jb'
  end

  def create
    @product = Product.create(
      name: params['name'],
      price: params['price'],
      image_url: params['image_url'],
      description: params['description']
    )
    render 'show_product.json.jb'
  end

  def update
    # find product by id
    @product = Product.find_by(id: params['id'])
    # update attributes using attribute writer(s)
    # (default/existing values used if nothing passed)
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    # save product
    @product.save
    # render a view
    render 'show_product.json.jb'
  end

  def destroy
    id = params['id']
    @product = Product.find_by(id: id)
    @product.destroy
    render json: {message: "Product id #{id} was deleted."}
  end

end
