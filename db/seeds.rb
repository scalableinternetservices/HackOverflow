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
# Creating 100 Buyers
#################################
puts "DEBUG: Creating 100 Buyers"

for i in 1..100 do
  Buyer.create!(email: "buyer_#{i}@example.com", password: "BuyerP@$$wor6", password_confirmation: "BuyerP@$$wor6")
end

#################################
# Creating 10 Sellers
#################################
puts "DEBUG: Creating 10 Sellers"

for i in 1..10 do
  Seller.create!(email: "seller_#{i}@example.com", password: "SellerP@$$wor6", password_confirmation: "SellerP@$$wor6")
end

#################################
# Creating 300 Items
#################################
puts "DEBUG: Creating 1000 Items. Creating with random seller ids. Might take a while..."

for i in 1..1000 do
  Item.create!(name: "Item_#{i}", description: "Half a league, half a league, half a league onward. All in the valley of Death. Rode the six hundred... Into the valley o death, rode the six hundred.", price: rand(0..2000), seller_id: rand(1..10))
end
