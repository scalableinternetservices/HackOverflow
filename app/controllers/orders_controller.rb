class OrdersController < ApplicationController
	before_action :authenticate_buyer!

	def index

		@orders = Order.where(buyer_id: current_buyer.id).includes(:item).includes(:rating).paginate(page: params[:page], per_page: 10) # Needed to show latest orders first

	end
end
