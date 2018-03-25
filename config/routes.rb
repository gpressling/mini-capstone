Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    patch "/products/:id" => "products#update"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    get "/products" => "products#index"
    delete "/products/:id" => "products#destroy"

    get "/orders/:id" => "orders#index"
    post "/orders" => "orders#create"

    post "/users" => "users#create"

    post "/carted_products" => "carted_products#create"
    get "/carted_products" => "carted_products#index"
    delete "/carted_products/:id" => "carted_products#destroy"
  end
end
