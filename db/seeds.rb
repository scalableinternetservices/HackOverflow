# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |x|
    Item.create!(name: x, description: x+10, price: x+20)
end

4.times do |x|
    Cart.create!(buyer_id:1, item_id: x+1)
end

4.times do |x|
    Cart.create!(buyer_id:0, item_id: x+1)
end


Buyer.create!(email: "0@gmail.com", encrypted_password: "password", password: "password")
Buyer.create!(email: "1@gmail.com", encrypted_password: "password", password: "password")


3.times do |x|
    Address.create!(buyer_id: 1, street_address: "street", city: "city", state: "state", zipcode: "93106")
end