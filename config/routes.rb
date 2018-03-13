Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    patch "/products/:id" => "products#update"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    get "/products" => "products#index"
    delete "/products/:id" => "products#destroy"
  end
end
