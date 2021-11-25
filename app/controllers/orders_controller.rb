class OrdersController < ApplicationController
	before_action :authenticate_buyer!

	def index
		@orders = Order.where(buyer_id: current_buyer.id).paginate(page: params[:page], per_page: 10)
	end
end
