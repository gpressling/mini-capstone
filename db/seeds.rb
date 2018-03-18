# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Supplier.create(name: "Amazon", email: "amazon@email.com", phone_number: "800-555-5555")
Supplier.create(name: "supplier", email: "supplier@email.com", phone_number: "845-123-4567")
Supplier.create(name: "press_box", email: "press_box@email.com", phone_number: "111-222-3344")


Product.create(name: "Custom T-Shirt", price: 30, description: "Create your own custom graphic T-Shirt")
Product.create(name: "Custom Hat", price: 25, description: "Create your own custom Hat")
Product.create(name: "Custom Night stick", price: 1000, description: "Don't get caught out after dark without your very own, CUSTOM NIGHT STICK")
Product.create(name: "Custom Website", price: 12000, description: "pay me to build you a custom website!")
Product.create(name: "Custom Software", price: 10000, description: "pay me to build you custom software to do anything you choose on your computer!")
Product.create(name: "Party Services", price: 2000, description: "you need a crazy party? call me and my team will deck you out with an amazing party. $2,000 on top of your party budget.")

Image.create(url: "https://www.google.com", product_id: "1")
Image.create(url: "https://www.google.com", product_id: "2")
Image.create(url: "https://www.google.com", product_id: "3")
Image.create(url: "https://www.google.com", product_id: "3")
Image.create(url: "https://www.google.com", product_id: "4")
Image.create(url: "https://www.google.com", product_id: "5")
Image.create(url: "https://www.google.com", product_id: "6")
