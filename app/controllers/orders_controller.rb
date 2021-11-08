class OrdersController < ApplicationController

	def index
		@orders = Order.all.reverse # Needed to show latest orders first
	end
end
