Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  get "/products" => "products#index"
  get "/products/new" => "products#new"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  get "/products/:id/edit" => "products#edit"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE

  namespace :api do

    # New REST paths to replace above routes
    get "/products" => "products#index"
    get "/products/:id" => "products#show"

    post "/products/" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    post "/images" => "images#create"

    post "/users" => "users#create"         # create a new user
    post "/sessions" => "sessions#create"   # for users to log in

    post "/orders" => "orders#create"       # Create a new order
    get "/orders" => "orders#index"         # Show all orders FOR CURRENT USER
    get "/orders/:id" => "orders#show"          # Show specific order

    get "/carted_products" => "carted_products#index"
    post "/carted_products" => "carted_products#create"
    delete "/carted_products/:id" => "carted_products#destroy"

  end

end
