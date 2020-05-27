Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    get "/all_products" => "products#all_products_action"
    get "/product1" => "products#product1_action"
    get "/product2" => "products#product2_action"
    get "/product3" => "products#product3_action"
    get "/product4" => "products#product4_action"
  end

end
