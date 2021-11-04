class CartController < ApplicationController
  def showcart
	items = Cart.order(:id)
	@carts = items
	
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
end
