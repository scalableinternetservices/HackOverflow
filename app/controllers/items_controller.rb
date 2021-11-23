class ItemsController < ApplicationController
	before_action :authenticate_seller!, only: [:new, :create]

	def new
		@item = Item.new
	end

	def show
		@item = Item.find(params[:id])
		@orders = @item.orders
		@ratings = []
		@stars = []
		@orders.each do |order|
			if !!(order.rating)
				@ratings << order.rating
				@stars << order.rating.stars
			end
		end

		# if more than one stars awarded, calculate avg
		# else give a default 0 rating
		if @stars.count > 0
			@overall_rating = @stars.sum.to_f / @stars.count
		else
			@overall_rating = 0.0
		end

		@overall_rating = @overall_rating.round(1) # Rounding it to 1 decimal point
	end

	def create
		@item = current_seller.items.new(item_params)

		if @item.save
			redirect_to root_path, notice: "You Have Successfully posted an Item!"
		else
			redirect_to root_path, notice: "Something went wrong. Try again. Item not posted!"
		end
	end
	private
		def item_params
			params.require(:item).permit(:name, :description, :price)
		end

end
