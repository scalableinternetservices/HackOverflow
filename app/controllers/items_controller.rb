class ItemsController < ApplicationController
	before_action :authenticate_seller!, only: [:create]

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
		@overall_rating = @stars.sum / @stars.count
		@overall_rating = @overall_rating.round(1) # Rounding it to 1 decimal point
	end

	def create
		@item = Item.new(item_params)

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
