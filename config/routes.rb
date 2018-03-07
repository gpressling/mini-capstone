Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/first_product" => "products#first_product"
  get "/second_product" => "products#second_product"
  get "/third_product" => "products#third_product"
  get "/all_products" => "products#all_products"
end
