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

  # Check to authorize admin for all except index and show (anyone can do these)
  before_action :authenticate_admin, except: [:index, :show]
  # before_action :authenticate_admin, only: [:create, :destroy, :update]    # Does same thing as line above

  # Rewriting above methods with RESTful methods
  def index
    @products = Product.all

    # If category parameter is passed, look up by category
    if params[:category]
      cat = Category.find_by(name: params[:category])
      @products = cat.products
    end

    if (search = params[:search])                               # If search query (name) is provided, filter index by that
      @products = @products.where("name iLIKE ?", "%#{search}%")
    end

    if (params[:discount] == "true")                            # If parameter 'discount' is true, show items under $10 only
      @products = @products.where("price < ?", "10")              
    elsif (params[:discount] == "false")
      @products = @products.where("price >= ?", "10")           # If params discount = false, show items = or above $10 only
    end

    if (params[:sort] == "price")                               # If params sort=price
      if (params[:sort_order] == "desc")                        # If params sort=price and sort_order=desc
        @products = @products.order(price: :desc)                 # Sort by price descending
      else
        @products = @products.order(:price)                     # If params sort = price, sort by price ascending
      end
    else
      @products = @products.order(:id)                          # Sort index by id, if no order specified in params
    end

    render 'index.json.jb'
  end

  def show
    id = params['id']
    if (@product = Product.find_by(id: id))
      render 'show_product.json.jb'
    else
      render json: { error: "Product with id #{id} does not exist."}, status: :unprocessable_entity
    end
  end

  def create
    @product = Product.new(
      name: params['name'],
      price: params['price'],
      # image_url: params['image_url'],
      description: params['description'],
      in_stock: params['in_stock'],
      supplier_id: params['supplier_id']
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
    # @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.in_stock = params[:instock] || @product.in_stock
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
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
