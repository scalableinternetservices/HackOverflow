class CartController < ApplicationController
  before_action :authenticate_buyer!

  def showcart

		items = Cart.where(buyer_id: current_buyer.id).order(:id)
		@carts = items.paginate(page: params[:page], per_page: 10)

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
		    Order.create(:item_id => item['item_id'], :quantity => item['quantity'],
					:buyer_id => current_buyer.id)
		  end
		  Cart.delete_all
		end
		render 'cart/placeorder'
  end

  def additem
  	item_id = params[:id]

  	#buyer_id = current_buyer.id
	item_exist = Cart.where(item_id: item_id, buyer_id: current_buyer.id)
  	#if Cart.find_by_item_id(item_id)
	if !item_exist.empty?
  		redirect_to root_path, notice: "Item already exists in the Cart"
  		return
  	end
  	@cart = Cart.new(item_id: item_id, buyer_id: current_buyer.id)
  	if @cart.save
			redirect_to root_path, notice: "Item succesfully added to the Cart"
		else
			redirect_to root_path, notice: "Something went wrong"
		end
  end

  def deleteitem
	item_id = params[:id]
	#if Cart.find_by_item_id(item_id)
	item_exist = Cart.where(item_id: item_id, buyer_id: current_buyer.id)
	if !item_exist.empty?
		Cart.where(item_id: item_id, buyer_id: current_buyer.id).destroy_all
		item = Item.find(item_id)
		redirect_to showcart_path, notice: item.name+ " removed from the Cart"
	end
  end
end
