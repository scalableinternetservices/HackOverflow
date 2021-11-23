class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token # Trying to get rid of 422 errors
  def index
    @items = Item.paginate(page: params[:page], per_page: 10) # Can't reverse. No need I guess
  end
end
