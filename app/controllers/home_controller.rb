class HomeController < ApplicationController
  def index
    @items = Item.paginate(page: params[:page])
  end
end
