class OrdersController < ApplicationController
	before_action :authenticate_buyer!

	def index
		@orders = Order.where(buyer_id: current_buyer.id).reverse # Needed to show latest orders first
	end
end
