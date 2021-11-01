class RatingsController < ApplicationController
	def new
		redirect_to orders_path, notice: "This Order is already rated." if Order.find(params[:order_id]).is_rated
		@rating = Rating.new
	end

	def create
		@rating = Rating.new(rating_params)

		if @rating.save
			@rating.order.is_rated = true
			redirect_to orders_path, notice: "Order was successfully rated."
		else
			redirect_to orders_path, notice: "Something Went Wrong!"
		end
	end

	private

		def rating_params
			params.require(:rating).permit(:stars, :comment, :order_id)
		end
end
