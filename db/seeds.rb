# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# PRODUCT
Product.destroy_all
product1 = Product.create({:name=>"tomato", :price => 1})
product2 = Product.create({:name=>"milk", :price => 3})
product3 = Product.create({:name=>"bread", :price => 5.50})
product4 = Product.create({:name=>"bacon", :price => 10})
product5 = Product.create({:name=>"cheese", :price => 3.20})

puts "Total number of products: #{Product.all.count}"
puts "Product names: #{Product.all.pluck("name")}"
puts "Product1: #{product1.name} price: #{product1.price.round(2)}"
puts "Product2: #{product2.name} price: #{product2.price.round(2)}"
puts "Product3: #{product3.name} price: #{product3.price.round(2)}"
puts "Product4: #{product4.name} price: #{product4.price.round(2)}"
puts "Product5: #{product5.name} price: #{product5.price.round(2)}"

# CART
Cart.destroy_all
LineItem.destroy_all
Order.destroy_all
User.destroy_all
puts "\nTotal cart count: #{Cart.all.count}"