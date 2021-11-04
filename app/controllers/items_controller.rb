class ItemsController < ApplicationController
	def new
		@item = Item.new	
	end

	def show
		@item = Item.find(params[:id])
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
