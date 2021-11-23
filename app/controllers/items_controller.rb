class ItemsController < ApplicationController
	before_action :authenticate_seller!, only: [:new, :create]

	def new
		@item = Item.new
	end

	def show
		@item = Item.find(params[:id])
		@ratings = @item.ratings.paginate(page: params[:page], per_page: 10)
		# if more than one stars awarded, calculate avg
		# else give a default 0 rating
		@overall_rating = @ratings.count > 0 ? @ratings.sum(:stars).to_f / @ratings.count : 0.0
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
