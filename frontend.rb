require "unirest"

# Login and set jwt as part of Unirest requests

# puts "Enter User email: "
# user_email = gets.chomp
# puts "Enter a password: "
# user_password = gets.chomp

response = Unirest.post(
  "http://localhost:3000/user_token",
  parameters: {
    auth: {
      email: "peter@email.com",
      password: "password"
    }
  }
)
jwt = response.body["jwt"]
Unirest.default_header("Authorization", "Bearer #{jwt}")

system "clear"
puts "Your jwt is #{jwt}"
puts "Welcome to Mini Capstone"
puts "[1] See all products" 
puts "  [1.1] Search products"
puts "[2] see one product"
puts "[3] Create a product"
puts "[4] Update a product"
puts "[5] Delete a contact"
puts "[6] Order a product"
puts "[signup] Signup (create a user)"
puts "[7] see all orders"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/products")
  product = response.body
  puts JSON.pretty_generate(product)

elsif input_option == "1.1"
  print "Search by name: "
  data = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products?input_search_terms=#{data}")
  products = response.body
  puts JSON.pretty_generate(products)

elsif input_option == "2"
  print "Enter a product id: "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  puts JSON.pretty_generate(product)

elsif input_option == "3"
  puts "Enter Product Name: "
  product_name = gets.chomp
  puts "Enter Product Price: "
  product_price = gets.chomp
  puts "Enter a Product image_url: "
  product_image_url = gets.chomp
  puts "Enter a Product description: "
  product_description = gets.chomp

  params = {
    "name" => product_name,
    "price" => product_price,
    "image_url" => product_image_url,
    "description" => product_description
  }
  response = Unirest.post("http://localhost:3000/v1/products", parameters: params)
  product = response.body
  if product["errors"]
    puts "Uh oh! Something went wrong..."
    p product["errors"]
  else
    puts "Here is your product info:"
    puts JSON.pretty_generate(product)
  end
elsif input_option == "4"
  puts "Enter a product id: "
  product_id = gets.chomp
  puts "Enter Product Name: "
  product_name = gets.chomp
  puts "Enter Product Price: "
  product_price = gets.chomp
  puts "Enter a Product image_url: "
  product_image_url = gets.chomp
  puts "Enter a Product description: "
  product_description = gets.chomp

  params = {
    "name" => product_name,
    "price" => product_price,
    "image_url" => product_image_url,
    "description" => product_description
  }
  params.delete_if { |_key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
  product = response.body
  if product["errors"]
    puts "Uh oh! Something went wrong..."
    p product["errors"]
  else
    puts "Here is your product info:"
    puts JSON.pretty_generate(product)
  end
elsif input_option == "5"
  print "Enter a product id: "
  product_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
  body = response.body
  puts JSON.pretty_generate(body)
elsif input_option == "6"
  params = {}

  print "Order quantity: "
  params["quantity"] = gets.chomp
  print "Enter product id: "
  params["product_id"] = gets.chomp

  response = Unirest.post("http://localhost:3000/v1/orders/", parameters: params)
  order = response.body
  puts JSON.pretty_generate(order)


  elsif input_option == "signup"
    puts "Enter User Name: "
    user_name = gets.chomp
    puts "Enter User email: "
    user_email = gets.chomp
    puts "Enter a password: "
    user_password = gets.chomp
    puts "Enter your password again: "
    user_password_confirmation = gets.chomp

    params = {
    name: user_name,
    email: user_email,
    password: user_password,
    password_confirmation: user_password_confirmation
    }
    response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
    p response.body

end
