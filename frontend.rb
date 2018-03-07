require "unirest"

system "clear"
puts "Choose an option:"
puts "[1] Show first product"
puts "[2] Show second product"
puts "[3] Show third product"
puts "[4] Show all products"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/first_product")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "2"
  response = Unirest.get("http://localhost:3000/second_product")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "3"
  response = Unirest.get("http://localhost:3000/third_product")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "4"
  response = Unirest.get("http://localhost:3000/all_products")
  products = response.body
  puts JSON.pretty_generate(products)
end
