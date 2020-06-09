Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    # get "/all_products" => "products#all_products_action"
    # get "/product1" => "products#product1_action"
    # get "/product2" => "products#product2_action"
    # get "/product3" => "products#product3_action"
    # get "/product4" => "products#product4_action"
    # # create a single route that can display ANY single product using a query parameter
    # get "/getproduct" => "products#product_param_action"
    # # create a single route that can display ANY single product using a url segment parameter
    # get "/getproduct/:prod_id" => "products#product_param_action"

    # New REST paths to replace above routes
    get "/products" => "products#index"
    get "/products/:id" => "products#show"

    post "/products/" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    post "/images" => "images#create"

    post "/users" => "users#create"

  end

end
