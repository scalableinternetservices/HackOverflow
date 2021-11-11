class CartController < ApplicationController
  before_action :authenticate_buyer!

  def showcart
		items = Cart.order(:id)
		@carts = items
		@addresses = Address.all
		#@addresses = Address.where(buyer_id: params[:id]).take
		
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
		    Order.create(:item_id => item['item_id'], :quantity => item['quantity'])
		  end
		  Cart.delete_all
		end
		render 'cart/placeorder'
  end

  def additem
  	temp = params[:id]
  	ind = temp.index('*')
  	item_id = temp[0..ind-1]

  	buyer_id = temp[ind+1..-1]

  	if !!Cart.find_by_item_id(item_id)
  		redirect_to root_path, notice: "Item already exists in the Cart"
  		return
  	end
  	@cart = Cart.new(item_id: item_id, buyer_id: buyer_id)
  	if @cart.save
			redirect_to root_path, notice: "Item succesfully added to the Cart"
		else
			redirect_to root_path, notice: "Something went wrong"
		end
  end
end
