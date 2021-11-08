class HomeController < ApplicationController
  def index
    @items = Item.all.reverse # Needed to show recently added items first
  end
end
