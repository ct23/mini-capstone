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
    id = params['id']
    if @product = Product.find_by(id: id)
      render 'show_product.json.jb'
    else
      render json: { error: "Product with id #{id} does not exist."}, status: :unprocessable_entity
    end
  end

  def create
    @product = Product.new(
      name: params['name'],
      price: params['price'],
      image_url: params['image_url'],
      description: params['description'],
      in_stock: params['in_stock']
    )
    if @product.save
      render 'show_product.json.jb'
    else
      render json: {message: "Product invalid",
                    errors: @product.errors.full_messages}, status: :unprocessable_entity # status: 422
    end
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
    @product.in_stock = params[:instock] || @product.in_stock
    # save product
    if @product.save
      # render a view
      render 'show_product.json.jb'
    else
      render json: {message: "Product invalid",
        errors: @product.errors.full_messages}, status: :unprocessable_entity # status: 422
    end
  end

  def destroy
    id = params['id']
    if (@product = Product.find_by(id: id))
      @product.destroy
      render json: {message: "Product id #{id} was deleted."}
    else
      render json: { error: "Product with id #{id} does not exist."}, status: :unprocessable_entity
    end
  end

end
