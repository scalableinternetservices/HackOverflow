# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#################################
# Clean the Tables before Seeding
#################################
puts "DEBUG: Cleaning up all the databases"

Buyer.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('buyers')
Seller.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('sellers')
Cart.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('carts')
Item.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('items')
Order.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('orders')
Rating.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('ratings')

#################################
# Set X
#################################

X = 1000
puts "DEBUG: X is set to #{X}"

#################################
# Creating X/3 Buyers
#################################
puts "DEBUG: Creating #{X/3} Buyers"

for i in 1..X/3 do
  Buyer.create!(email: "buyer_#{i}@example.com", password: "BuyerP@$$wor6", password_confirmation: "BuyerP@$$wor6")
end

#################################
# Creating X/4 Sellers
#################################
puts "DEBUG: Creating #{X/4} Sellers"

for i in 1..X/4 do
  Seller.create!(email: "seller_#{i}@example.com", password: "SellerP@$$wor6", password_confirmation: "SellerP@$$wor6")
end

#################################
# Creating X Items
#################################
puts "DEBUG: Creating #{X} Items. Creating with random seller ids. Might take a while..."

for i in 1..X do
  Item.create!(name: "Item_#{i}", description: "Half a league, half a league, half a league onward. All in the valley of Death. Rode the six hundred... Into the valley o death, rode the six hundred.", price: rand(0..2000), seller_id: rand(1..X/4))
end
