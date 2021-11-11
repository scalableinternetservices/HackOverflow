class CartController < ApplicationController
  before_action :authenticate_buyer!

  def showcart
		puts params[:buyer_id]
		#items = Cart.order(:id)
		items = Cart.where(buyer_id: params[:buyer_id]).order(:id)
		@carts = items
		#@addresses = Address.all
		@addresses = Address.where(buyer_id: params[:buyer_id])
		
		price = 0;
		items.each do |cart|
		  price += cart.item.price
		end
		@totalcost = price
		render 'cart/showcart'
  end

  def placeorder
		item_ids = JSON.parse(params[:requestparam])
		ActiveRecord::Base.transaction do
		  item_ids["body"].each do |item|
			# include buyer id
		    Order.create(:item_id => item['item_id'], :quantity => item['quantity'])
		  end
		  Cart.delete_all
		end
		render 'cart/placeorder'
  end

  def additem
  	if !!Cart.find_by_item_id(params[:id])
  		redirect_to root_path, notice: "Item already exists in the Cart"
  		return
  	end
  	@cart = Cart.new(item_id: params[:id])
  	if @cart.save
	puts "Sharath1"
		redirect_to root_path, notice: "Item succesfully added to the Cart"
	else
		puts "Sharath2"
		redirect_to root_path, notice: "Something went wrong"
	end
  end

  def deleteitem
	item_id = params[:id]
	if Cart.find_by_item_id(item_id)
		Cart.find_by_item_id(item_id).destroy
		item = Item.find(item_id)
		redirect_to showcart_path, notice: item.name+ " removed from the Cart"
	end
  end
end
