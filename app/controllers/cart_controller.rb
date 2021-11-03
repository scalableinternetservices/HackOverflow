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
	
	render 'cart/placeorder'
  end
end
