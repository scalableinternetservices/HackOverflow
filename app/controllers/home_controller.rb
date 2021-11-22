class HomeController < ApplicationController
  def index
    @items = Item.paginate(page: params[:page], per_page: 10) # Can't reverse. No need I guess
  end
end
