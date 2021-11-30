# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'active_support/time'

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
  Buyer.create!(email: "buyer#{i}@example.com", password: "password", password_confirmation: "password")
end

#################################
# Creating 100 Sellers
#################################
puts "DEBUG: Creating 100 Sellers"

for i in 1..100 do
  Seller.create!(email: "seller#{i}@example.com", password: "password", password_confirmation: "password")
end

#################################
# Creating 500,000 Items
#################################
puts "DEBUG: Creating 500,000 Items. Might take a while..."

items = []
conn = ActiveRecord::Base.connection()

for i in 1..500000 do
  item = ["Item_#{i}", "Half a league, half a league, half a league onward. All in the valley of Death. Rode the six hundred... Into the valley of death, rode the six hundred.", rand(0..2000), rand(1..5)]
  items << item
  #Item.create!(name: "Item_#{i}", description: "Half a league, half a league, half a league onward. All in the valley of Death. Rode the six hundred... Into the valley of death, rode the six hundred.", price: rand(0..2000), seller_id: rand(1..5)) # Only 5 sellers are considered.
end

inserted_items = 0
items.in_groups_of(1000, fill_with = false) do |group|
	values = group.map { |item| "('#{item[0]}', '#{item[1]}', '#{item[2]}', '#{item[3]}', '#{Time.now}', '#{Time.now}')" }.join(", ")
	sql = "INSERT INTO items (name, description, price, seller_id, created_at, updated_at) VALUES #{values}"
	conn.execute(sql)
	inserted_items += group.size
	puts "		Inserted #{inserted_items}/#{items.size} entries in items table"
end

#################################
# Creating 25000 orders
#################################

puts "DEBUG: Creating 25000 Orders. Creating for first 5 buyers"

orders = []

for i in 1..5 do
	for j in 1..5000 do
		order = [rand(1..6), i, i]
		orders << order
		#Order.create!(quantity: rand(1..6), item_id: i, buyer_id: i)
	end
end


inserted_orders = 0
orders.in_groups_of(1000, fill_with = false) do |group|
	values = group.map { |order| "('#{order[0]}', '#{order[1]}', '#{order[2]}', '#{Time.now}', '#{Time.now}')" }.join(", ")
	sql = "INSERT INTO orders (quantity, item_id, buyer_id, created_at, updated_at) VALUES #{values}"
	conn.execute(sql)
	inserted_orders += group.size
	puts "		Inserted #{inserted_orders}/#{orders.size} entries in orders table"
end
#################################
# Creating 25000 Carts
#################################

puts "DEBUG: Creating 25000 Carts. Creating for 5 buyers"

carts = []
for i in 1..5 do
	for j in 1..5000 do
		cart = [rand(1..250000), i]
		carts << cart
		#Cart.create!(item_id: rand(1..250000), buyer_id: i)
	end
end

inserted_carts = 0
carts.in_groups_of(1000, fill_with = false) do |group|
	values = group.map { |cart| "('#{cart[0]}', '#{cart[1]}', '#{Time.now}', '#{Time.now}')" }.join(", ")
	sql = "INSERT INTO carts (item_id, buyer_id, created_at, updated_at) VALUES #{values}"
	conn.execute(sql)
	inserted_carts += group.size
	puts "		Inserted #{inserted_carts}/#{carts.size} entries in carts table"
end
